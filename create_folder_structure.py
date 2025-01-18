import os
import sys


def create_folder_structure(parent_directory, main_folder, sub_folders):
    main_folder_path = os.path.join(parent_directory, main_folder)
    os.makedirs(main_folder_path, exist_ok=True)
    print(f"Created main folder: {main_folder}")

    dart_files_in_data_sources = []
    dart_files_in_repositories = []
    dart_files_in_controller = []

    for folder, sub_folders_list in sub_folders.items():
        folder_path = os.path.join(main_folder_path, folder)
        os.makedirs(folder_path, exist_ok=True)
        if folder == "domain":
            dart_file = create_dart_file(folder_path, main_folder, "Repository")
            dart_files_in_repositories.append(dart_file)
        elif folder == "presentation":
            dart_file = create_dart_file_controller(
                folder_path, main_folder, "Controller"
            )
            dart_file_screen = create_dart_file_screen(
                folder_path, main_folder, "Screen"
            )
            dart_file_import = create_dart_file_import(
                folder_path, main_folder, "Imports"
            )
            dart_files_in_controller.append(dart_file)
            dart_files_in_controller.append(dart_file_import)
            dart_files_in_controller.append(dart_file_screen)

        print(f"Created sub folder: {folder_path}")

        for sub_folder in sub_folders_list:
            sub_folder_path = os.path.join(folder_path, sub_folder)
            os.makedirs(sub_folder_path, exist_ok=True)
            print(f"Created sub folder: {sub_folder_path}")

            if sub_folder == "data_sources":
                dart_file = create_dart_file(sub_folder_path, main_folder, "DataSource")
                dart_files_in_data_sources.append(dart_file)
                dart_file_impl = create_dart_file_impl(
                    sub_folder_path, main_folder, "DataSource_Impl", "DataSourceImpl", 0
                )
                dart_files_in_data_sources.append(dart_file_impl)

            elif sub_folder == "repositories":

                dart_file_impl = create_dart_file_impl(
                    sub_folder_path, main_folder, "Repository_Impl", "RepositoryImpl", 1
                )
                dart_files_in_repositories.append(dart_file_impl)

    return (
        dart_files_in_data_sources,
        dart_files_in_repositories,
        dart_files_in_controller,
    )


def create_dart_file(folder_path, main_folder, class_suffix):
    words = main_folder.split("_")
    first_class_name = words[0].capitalize() + "".join(
        word.capitalize() for word in words[1:]
    )
    class_name = first_class_name + class_suffix
    file_name = f"{main_folder}_{class_suffix.lower()}.dart"
    file_path = os.path.join(folder_path, file_name)

    with open(file_path, "w") as file:
        file_content = f"abstract class {class_name} {{\n\n}}"
        file.write(file_content)

    return file_name


def create_dart_file_impl(folder_path, main_folder, class_suffix, class_name, isRepo):
    words = main_folder.split("_")
    first_class_name = words[0].capitalize() + "".join(
        word.capitalize() for word in words[1:]
    )

    class_name = first_class_name + class_name
    file_name = f"{main_folder}_{class_suffix.lower()}.dart"
    file_path = os.path.join(folder_path, file_name)

    with open(file_path, "w") as file:
        file_content = "import 'package:injectable/injectable.dart';\n"
        if isRepo == 0:
            file_content += f'import "{file_name.replace("_impl","")}";\n'
        elif isRepo == 1:
            file_content += f'import "../../domain/{file_name.replace("_impl","")}";\n'

        file_content += f"@Injectable(as: {first_class_name}{class_suffix[:-5]} )\n"
        file_content += (
            f"class {class_name} extends {first_class_name}{class_suffix[:-5]} {{\n\n}}"
        )
        file.write(file_content)

    return file_name


def create_dart_file_controller(folder_path, main_folder, class_suffix):
    words = main_folder.split("_")
    first_class_name = words[0].capitalize() + "".join(
        word.capitalize() for word in words[1:]
    )
    class_name = first_class_name + class_suffix
    file_name = f"{main_folder}_{class_suffix.lower()}.dart"
    file_path = os.path.join(folder_path, file_name)

    with open(file_path, "w") as file:
        leftBracket = "{"
        rightBracket = "}"

        file_content = f'part of "{main_folder}_imports.dart";\n\n'
        file_content += f"class {class_name} extends BaseController {leftBracket}\n\n"
        file_content += f'static const routeName = "{first_class_name}ScreenRoute";\n\n'

        file_content += f"{class_name}();\n\n"

        file_content += f"\n@override\nvoid dispose() {{\n}}"
        file_content += f"\n\n@override\nvoid setBuildContext(BuildContext widgetContext) {{\ncontext = widgetContext;\n}}"

        file_content += f"\n{rightBracket}"
        file.write(file_content)

    return file_name


def create_dart_file_import(folder_path, main_folder, class_suffix):
    file_name = f"{main_folder}_{class_suffix.lower()}.dart"
    file_path = os.path.join(folder_path, file_name)

    with open(file_path, "w") as file:

        file_content = f"import 'package:altarek/core/common/base_controller.dart';\n"
        file_content += f"import 'package:auto_route/auto_route.dart';\n"
        file_content += f"import 'package:flutter/material.dart';\n"
        file_content += f'part "{main_folder}_screen.dart";\n'
        file_content += f'part "{main_folder}_controller.dart";\n'

        file.write(file_content)

    return file_name


def create_dart_file_screen(folder_path, main_folder, class_suffix):
    words = main_folder.split("_")
    first_class_name = words[0].capitalize() + "".join(
        word.capitalize() for word in words[1:]
    )
    class_name = first_class_name + class_suffix
    file_name = f"{main_folder}_{class_suffix.lower()}.dart"
    file_path = os.path.join(folder_path, file_name)

    with open(file_path, "w") as file:
        leftBracket = "{"
        rightBracket = "}"

        file_content = f""" 
 part of "{main_folder}_imports.dart";\n\n

@RoutePage(name: {first_class_name}Controller.routeName)
  class {class_name} extends StatefulWidget {leftBracket}
  const {class_name}({leftBracket}super.key{rightBracket});

  @override
  State<{class_name}> createState() => _{class_name}State();
{rightBracket}

class _{class_name}State extends State<{class_name}> {leftBracket}
  late {first_class_name}Controller controller;

  @override
  void initState() {leftBracket}
    controller = {first_class_name}Controller();
    controller.setBuildContext(context);
    super.initState();
{rightBracket}
  @override
  Widget build(BuildContext context) {leftBracket}
    return Container();
  {rightBracket}
{rightBracket}
        """

        file.write(file_content)

    return file_name


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print(
            "Usage: python create_folder_structure.py <Parent_Directory_Path> <Main_Folder_Name>"
        )
        sys.exit(1)

    parent_directory = sys.argv[1]
    main_folder_name = sys.argv[2]

    sub_folders = {
        "data": ["data_sources", "models", "repositories"],
        "domain": [],
        "presentation": [],
    }

    dart_files_in_data_sources, dart_files_in_repositories, dart_files_in_controller = (
        create_folder_structure(parent_directory, main_folder_name, sub_folders)
    )

    print("\nDart files created in the 'data_sources' folder:")
    for dart_file in dart_files_in_data_sources:
        print(f"File: {dart_file}")

    print("\nDart files created in the 'repositories' folder:")
    for dart_file in dart_files_in_repositories:
        print(f"File: {dart_file}")
    print("\nDart files created in the 'presentation' folder:")
    for dart_file in dart_files_in_controller:
        print(f"File: {dart_file}")
