import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'dart:convert';
import 'package:insiit/gsheets/commonFunctions.dart';

List<List<List<String>>> temp_meals = [];
int messMenuMonth = 0;

class userSheetsAPI {
  // credentials of service account
  static const _credentials = r'''{
    "type": "service_account",
    "project_id": "insiit-mess-menu",
    "private_key_id": "a778df4b47d20fc2e5a1293461d73d2acba0d345",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCu/j1yTY1K8jYc\nCduXZEyrS3fsl4Sxo+5bue7t9uwNNk/44JmO09QM9qPqslJMrIkFgTwuyCqFWBQj\nIQ83CI3wZqiDAFZAEbRPbbiDdym6Eh3zNRekHuvtEm/Si8xpSMdF+2Z06Htp+LTx\n19nmuA5rRBrW+fgbbd/ig+9ofmjjKLd8bxPssGfLLiQM3idIH8aeJJI6KcNb6Nfm\nTn2TZpGgNB1ONDOw2Wy2CtuMmGctVYOljsiFKaVnphfBcmub2SKBja1yS20bJGXf\n55ILWr1BdH9IMdeKw0qj4arXWE1MZkGzdvQFCNSKkSF03p8YHCbveRC2I8Rky0qb\n3dXRaWA/AgMBAAECggEAAqOU5k9jF8PqqvuUaIZmXZhIGQpOlvs451XjfjU2FBuY\nkyaX9Oke498oU6wYGk3pIcB0LuRtN7uUpNRPzW2p7lEuA2O9k+kbG1jf6nj2k8wd\neth3IHjS6AKvgFuusSZxfY2wBYf9VyNytHROi0XapHrPc3nWPbD81QarqptqwNo1\nnOVygXB15Ijq3rLzcL66rprJvvwecN7fawqfNYdVeTAgU/CrmYkLzOL9segj5FbJ\nj+XsY79/I1tL08LA68hWN1EVppHtyq/fi5qLHAvTIZWb1tdrDA1LzjcWmejmcW9m\nLlkSQiWoEjWLQZ2vMDACH0z4LvCEvBsK4/zBYIVH0QKBgQDg4nNqzuyR3BLwjTnT\nnGTOY+mk/TGMwn8yMIkdtQtLxCHL2xsTLpErj45onAS7pOFqd1V9q8XVA9Nyqy5C\nr6PntSbegbokAvoj4/V8Yv9liWBympzkbxiyj7olS1rJ+EkSuzA9oBug3t3XYN66\nWsKqCGyOKgV4+plZ/L8ejXn/RwKBgQDHNJqCdwzLOp39HfNg9a4qvJGxzuuVZ20y\n5jKd6JOnHeFm7mSfHgvQwJJmys1l0X6SOartr7eB8b2d0dIDfBIs/MLFA3+qJ4i9\nljagg2uHXAUs8G3dvxtONh0fO9KYvZOn6Yhu7xf4Y7Si97H6h9qSwMa1KqFxrLws\nGj9CHbBDSQKBgQDDKWL2n2tIzg+VuUok7gXB442BxMW6nZRbTym/oT2TXDvkOVsO\n04vinOv+tt+YpOeHSNblgCvoyDA5xHsaHmmFDX4U/co3tGm2uf9yGkwApy8PZkSg\nLhXl6Lun3/SDcLihy9d6s7cmbiNh5cyFN3zWqQbkfW1QZ1KseJ63+hmUwwKBgQCO\nObGDKop44y3/lQ26EU67doyzHaA3uHNPnulOssoQzBWtTtGKhYI8FfGw8GS7qFos\n/n1aXFWxsi4GatL95+x2MDTDQt84Vieb7I6uBYaVSw7q6fIXGyXcrmgWb7jJkrjE\nbskZIx3DGzTSEfUBgVN96aM1n+1KYuCqwEaf5uB8+QKBgQC0NBIvSIHVCcxA56yS\n43ocVPEQbUhaeN4sx2p7M1I6IlQMBHZmQ9v1YyvizubtdiQYDMY5BQVJJvIqjlee\nGhewTQdu+cWcc5Ryyrkih2BASHk7AYrBHR7tkNK801Nd76NQWzYyTfUjXOjsSOKY\nAYFRDRN26a+f4v3TfVmO2JlFag==\n-----END PRIVATE KEY-----\n",
    "client_email": "insiit@insiit-mess-menu.iam.gserviceaccount.com",
    "client_id": "110485293465184666990",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/insiit%40insiit-mess-menu.iam.gserviceaccount.com"
  }''';

  // id of google sheet we want to access
  static final _sheetId = "16EKFO-B7YVqMO61IdgvZnv_H9M_37ZxqYiVLvWkrh8g";

  // initializing gsheets package
  static final _gSheet = GSheets(_credentials);
  static Worksheet? _userSheet;

  // mealItems is global variable used as buffer to add meal items of specific day and type
  static List<String> mealItems = [];

  //

  // init function
  static Future init() async {
    print(DateTime.now().month);
    print(messMenuMonth);
    print(temp_meals.length);
    if (DateTime.now() != messMenuMonth || temp_meals.length == 0) {
      print("Fetched Google sheet");
      final spreadSheet = await _gSheet.spreadsheet(_sheetId);
      // get a work sheet with title provided, if worksheet with given title does not will create one
      _userSheet = await getWorkSheet(spreadSheet, title: 'MessMenu');

      int numDays = 7;
      int numMeals = 4;

      // fetching data from given spread sheet

      for (int i = 1; i <= numDays; i++) {
        List<List<String>> temp_ver = [];
        for (int j = 1; j <= numMeals; j++) {
          await getMeal(i, j);

          List<int> temp = [i, j];

          temp_ver.add(mealItems);
        }

        temp_meals.add(temp_ver);
      }
      messMenuMonth = await getMonth();
    }
  }

  static Future<Worksheet> getWorkSheet(
    Spreadsheet spreadSheet, {
    required String title,
  }) async {
    try {
      // try to create worksheet of name title if already there fetch it using title
      return await spreadSheet.addWorksheet(title);
    } catch (e) {
      return spreadSheet.worksheetByTitle(title)!;
    }
  }

  static Future<void> populateList(int start, int end, int day) async {
    List<String> temp_list = await _userSheet!.values.column(day);
    for (int i = start; i <= end; i++) {
      mealItems.add(temp_list[i - 1]);
    }
  }

  static Future<void> getMeal(int day, int mealType) async {
    mealItems = [];
    if (mealType == 1) {
      await populateList(3, 11, day);
    } else if (mealType == 2) {
      await populateList(14, 22, day);
    } else if (mealType == 3) {
      await populateList(25, 28, day);
    } else if (mealType == 4) {
      await populateList(31, 39, day);
    }
  }

  static Future<int> getMonth() async {
    int temp = int.parse(await _userSheet!.values.value(column: 1, row: 40));
    print(temp);
    return temp;
  }
}
