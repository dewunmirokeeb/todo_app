import 'package:eventscheduler/routes/routes.dart';
import 'package:eventscheduler/widgets/todopagedrawertile.dart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/appbutton.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              SizedBox(
                height: 250,
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('asset/images/todo_app_pic_.jpg'),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Username\'s Todo',
                      style: GoogleFonts.caveat(
                        color: Colors.red.withGreen(10000),
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      TodoPageDrawerTile(
                        icon: Icons.star,
                        tiletitle: 'Starred',
                        onTapp: () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.starredtodopage);
                        },
                      ),
                      TodoPageDrawerTile(
                        icon: Icons.done,
                        tiletitle: 'Done',
                        onTapp: () {
                          Navigator.of(context).pushNamed(
                            RouteManager.donetodopage,
                          );
                        },
                      ),
                      TodoPageDrawerTile(
                        icon: Icons.delete,
                        tiletitle: 'Trash',
                        onTapp: () {
                          Navigator.of(context).pushNamed(
                            RouteManager.trashtodopage,
                          );
                        },
                      ),
                      TodoPageDrawerTile(
                        icon: Icons.settings,
                        tiletitle: 'Settings',
                        onTapp: () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.settingspage);
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Divider(
                        indent: 3,
                        endIndent: 3,
                        height: 1,
                        thickness: 2,
                        color: Colors.orange[100],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      APPButton(
                        buttontag: 'tap to read about developer',
                        onpressed: () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.aboutdeveloperpage);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
