part of "./part_of_learn.dart";

class _appbar extends StatelessWidget with PreferredSizeWidget {
  const _appbar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Part of learn theme"),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
