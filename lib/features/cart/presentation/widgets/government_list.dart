import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class government_list extends StatelessWidget {
  const government_list({super.key, required this.cubit});

  final CartCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final layerLink = LayerLink();
        OverlayEntry? overlayEntry;
        bool isOpen = false;

        final List<dynamic> governorates = cubit.governments;

        void toggleDropdown() {
          if (isOpen) {
            overlayEntry?.remove();
            isOpen = false;
          } else {
            final renderBox = context.findRenderObject() as RenderBox;
            final size = renderBox.size;
            final offset = renderBox.localToGlobal(Offset.zero);

            overlayEntry = OverlayEntry(
              builder: (context) => Positioned(
                left: offset.dx,
                top: offset.dy + size.height + 5,
                width: size.width,
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight:
                          200,
                    ),
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: governorates.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item = governorates[index];
                        return ListTile(
                          title: Text(
                            item.governorateNameEn ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          onTap: () {
                            cubit.governmentController.text =
                                item.governorateNameEn ?? '';
                            cubit.selectedGovernmentId =
                                item.id ?? 0; 
                            overlayEntry?.remove();
                            isOpen = false;
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            );

            Overlay.of(context).insert(overlayEntry!);
            isOpen = true;
          }
        }

        return CompositedTransformTarget(
          link: layerLink,
          child: TextFormField(
            controller: cubit.governmentController,
            readOnly: true,
            onTap: toggleDropdown,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleKeys.gov_validate.tr();
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: LocaleKeys.government.tr(),
              suffixIcon: const Icon(Icons.arrow_drop_down),
              filled: true,
              fillColor: AppColors.grayinputColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        );
      },
    );
  }
}
