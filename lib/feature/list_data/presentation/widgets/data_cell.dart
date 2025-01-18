part of 'package:flutter_appwrite_task/feature/list_data/presentation/list_data_imports.dart';

class DataCell extends StatelessWidget {
  final String title;
  final String description;
  const DataCell({super.key,required this.title,required this.description});

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      elevation: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title,
            textStyle: context.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600
            ),
            maxLines: 1000,
          ),
          Gaps.vGap5,
          CustomText(
            description,
            textStyle: context.textTheme.bodySmall!.copyWith(
              color: context.colors.grey5
            ),
            maxLines: 1000,
          ),
        ],
      ),
    );
  }
}
