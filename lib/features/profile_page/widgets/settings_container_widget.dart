import 'package:flutter/material.dart';

class SettingsContainerWidget extends StatelessWidget {
  final String containerName;
  final String containerItemValue;
  final IconData containerIcon;
  final onTap;
  const SettingsContainerWidget({
    super.key,
    required this.containerName,
    required this.containerItemValue,
    required this.onTap,
    required this.containerIcon,
  });

  @override
  Widget build(BuildContext context) {
    bool isEmpty = false;
    if (containerItemValue.isNotEmpty) {
      isEmpty = true;
    } else {
      isEmpty = false;
    }
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(width: 5),
              Icon(
                containerIcon,
              ),
              const SizedBox(width: 5),
              Expanded(child: Text(containerName)),
              Container(
                alignment: Alignment.center,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).canvasColor,
                ),
                child: Padding(
                  padding: isEmpty
                      ? const EdgeInsets.symmetric(horizontal: 10, vertical: 1)
                      : const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Text(containerItemValue),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
