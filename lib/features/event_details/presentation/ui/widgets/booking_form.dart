import 'package:amiy_app/core/utils/constants.dart';
import 'package:amiy_app/core/utils/responive.dart';
import 'package:amiy_app/features/event_details/presentation/bloc/event_details_bloc.dart';
import 'package:amiy_app/features/event_details/presentation/state/event_details_state.dart';
import 'package:amiy_app/features/event_details/presentation/ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/colors.dart';
import '../../events/event_details_event.dart';

/// A form for booking an event slot.
class BookingForm extends StatefulWidget {
  /// Creates a [BookingForm].
  ///
  /// The [responsive] parameter is required for responsive design.
  const BookingForm({super.key, required this.responsive});

  final Responsive responsive;

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  late EventDetailsBloc eventDetailsBloc;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    eventDetailsBloc = GetIt.I<EventDetailsBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<EventDetailsBloc, EventDetailsState>(
        bloc: eventDetailsBloc,
        listener: (context, state) {
          if (state.slotBooked == true) {
            _showSnackBar(context);
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: nameController,
                  label: "Name",
                  responsive: widget.responsive,
                  validator: (value) =>
                      value!.isEmpty ? 'Name is required' : null,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: emailController,
                  label: "Email",
                  responsive: widget.responsive,
                  validator: (value) => _validateEmail(value),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: phoneController,
                  label: "Phone",
                  responsive: widget.responsive,
                  validator: (value) => _validatePhone(value),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      eventDetailsBloc.add(BookMySlotEvent(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                      ));
                      _clearTextFieldLabels();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(AppColors.primaryColor),
                    padding: EdgeInsets.symmetric(
                      vertical: widget.responsive.blockSizeVertical * 1.8,
                      horizontal: widget.responsive.blockSizeHorizontal * 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "BOOK NOW",
                    style: GoogleFonts.montserrat(
                      fontSize: widget.responsive.fontSize(16),
                      fontWeight: FontWeight.w600,
                      color: const Color(AppColors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _clearTextFieldLabels() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          AppConstants.slotBooked,
          style: const TextStyle(
            fontSize: 16,
            color: Color(AppColors.white),
          ),
        ),
        backgroundColor: const Color(AppColors.primaryColor),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value!.isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value!.isEmpty) return 'Phone is required';
    if (value.length < 10) {
      return 'Enter a valid phone number';
    }
    return null;
  }
}
