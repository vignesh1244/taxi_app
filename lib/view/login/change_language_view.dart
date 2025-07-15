import 'package:flutter/material.dart';
import 'package:taxi_app/common/color_extention.dart';
import 'package:taxi_app/view/login/welcome_view.dart';

class ChangeLanguageView extends StatefulWidget {
  const ChangeLanguageView({super.key});

  @override
  State<ChangeLanguageView> createState() => _ChangeLanguageViewState();
}

List listArr = ["English", "Hindi", "Kannada"];

int selectChange = 0;

class _ChangeLanguageViewState extends State<ChangeLanguageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Image.asset("assets/img/back.png", width: 20, height: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 25, 0, 0),
        child: Column(
          children: [
            Text(
              "Choose a language",
              style: TextStyle(color: TColor.primaryText, fontSize: 25),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: listArr.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      setState(() {
                        selectChange = index;
                        context.push(WelcomeView());
                      });
                    },
                    title: Text(
                      listArr[index],
                      style: TextStyle(
                        color: index == selectChange
                            ? TColor.primary
                            : TColor.primaryText,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: index == selectChange
                        ? Image.asset(
                            "assets/img/check_tick.png",
                            width: 20,
                            height: 20,
                          )
                        : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
