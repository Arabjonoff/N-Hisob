import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:n_hisob/src/model/http_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider {
  static Duration durationTimeout = const Duration(seconds: 30);
  // String baseUrl = "http://192.168.1.141:8080";
  String baseUrl = "http://api.foodaudit.uz";


  static _headers()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString('token')??"";
    if(token.isNotEmpty){
      return  {
        "Authorization": 'token $token',
        "content-type": "application/json",
      };
    }
    else{
      return  {
        // "Authorization": "token ",
        "content-type": "application/json",
      };
    }

  }

  /// Api requests
  Future<HttpResult> _getRequest(String url) async {
    print(url);

    final dynamic headers = await _headers();
    try{
      http.Response response = await http.get(
          Uri.parse(url),
          headers: headers
      ).timeout(durationTimeout);
      return _result(response);
    } on TimeoutException catch(_){
      return HttpResult(
        isSuccess: false,
        statusCode: -1,
        result: "Network",
      );
    } on SocketException catch (_) {
      return HttpResult(
        isSuccess: false,
        statusCode: -1,
        result: "Network",
      );
    }
  }

  Future<HttpResult> _postRequest(String url, body) async {
    print(url);
    print(body);
    final dynamic headers = await _headers();
    try{
      http.Response response = await http.post(
          Uri.parse(url),
          body: body,
          headers: headers
      ).timeout(durationTimeout);
      return _result(response);
    } on TimeoutException catch(_){
      return HttpResult(
        isSuccess: false,
        statusCode: -1,
        result: "Network",
      );
    } on SocketException catch (_) {
      return HttpResult(
        isSuccess: false,
        statusCode: -1,
        result: "Network",
      );
    }

  }

  Future<HttpResult> _deleteRequest(String url,) async {
    final dynamic headers = await _headers();
    http.Response response = await http.delete(
        Uri.parse(url),
        headers: headers
    );
    return _result(response);
  }

  Future<HttpResult> _putRequest(String url, body) async {
    final dynamic headers = await _headers();
    http.Response response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: body
    );
    return _result(response);
  }


  HttpResult _result(http.Response response) {
    print(response.body);
    print(response.statusCode);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return  HttpResult(
        statusCode: response.statusCode,
        isSuccess: true,
        result: json.decode(utf8.decode(response.bodyBytes)),
      );
    } else {
      return HttpResult(
        statusCode: response.statusCode,
        isSuccess: false,
        result: response.body,
      );
    }
  }

  Future<HttpResult> register(String name, surname, phone) async {
    var body = {
      "name": name,
      "surname": surname,
      "phone": phone,
    };
    String url = "$baseUrl/api/register";
    return await _postRequest(url,json.encode(body));
  }

  Future<HttpResult> login(phone) async {
    var body = {
      "phone": phone,
    };
    String url = "$baseUrl/api/auth";
    return await _postRequest(url,json.encode(body));
  }

  Future<HttpResult> activate(phone,code) async {
    var body = {
      "phone": phone,
      "verification_code": code,
    };
    String url = "$baseUrl/api/activate";
    return await _postRequest(url,json.encode(body));
  }
  Future<HttpResult> addWallet(name,valyute,balans,bg) async {
    var body = {
      "name": name,
      "valyute_type": valyute,
      "balans": balans,
      "bg": bg,
    };
    String url = "$baseUrl/api/wallets";
    return await _postRequest(url,json.encode(body));
  }

  Future<HttpResult> getWallet() async {
    String url = "$baseUrl/api/wallets";
    return await _getRequest(url,);
  }


  Future<HttpResult> getWalletDetail(id,date) async {
    String url = "$baseUrl/operations/?operation_type=all&wallet=$id&filter_date=$date";
    return await _getRequest(url,);
  }

  Future<HttpResult> addClients(name,surname,phone,summa_uzs,summa_usd,lastopiration_date,comment,id,balanceUzs,balanceUsd) async {
    var body = {
      "name": name,
      "surname": surname,
      "phone": phone,
      "summa_uzs": summa_uzs,
      "summa_usd": summa_usd,
      "lastopiration_date": lastopiration_date,
      "comment": comment,
      "category": id,
      "balans_uzs":balanceUzs,
      "balans_usd":balanceUsd
    };
    String url = "$baseUrl/api/clients";
    return await _postRequest(url,json.encode(body));
  }


  Future<HttpResult> getClient(id) async {
    String url = "$baseUrl/api/clients?category_id=$id";
    return await _getRequest(url,);
  }
  Future<HttpResult> deleteClient(id) async {
    String url = "$baseUrl/api/client/$id/delete";
    return await _deleteRequest(url,);
  }
  Future<HttpResult> deleteOperation(id) async {
    String url = "$baseUrl/operations/$id";
    return await _postRequest(url,json.encode({}));
  }

  Future<HttpResult> updateClient(id,name,phone,summa_uzs,summa_usd,lastopiration_date,comment,category_id) async {
    String url = "$baseUrl/api/client/$id/update";
    var body = {
      "name": name,
      "surname": 'surname',
      "phone": phone,
      "summa_uzs": summa_uzs,
      "summa_usd": summa_usd,
      "lastopiration_date": lastopiration_date,
      "comment": comment,
      "category": category_id,

    };
    return await _putRequest(url,json.encode(body));
  }

  Future<HttpResult> search(query) async {
    String url = "$baseUrl/api/client/search?q=$query";
    return await _getRequest(url,);
  }

  Future<HttpResult> deleteWallet(id) async {
    String url = "$baseUrl/api/wallet/$id/delete";
    return await _deleteRequest(url,);
  }


  Future<HttpResult> addDebt(date,agent,wallet,summa_uzs,summa_usd,lastopiration_date,comment) async {
    var body = {
      "date": date,
      "client": agent,
      "wallet": wallet,
      "summa_uzs": summa_uzs,
      "summa_usd": summa_usd,
      "lastopiration_date": lastopiration_date,
      "comment": comment,
    };
    String url = "$baseUrl/api/clients";
    return await _postRequest(url,json.encode(body));
  }

  Future<HttpResult> addOperation(String type,date, int clientId,walletId,summaUzs,summaUsd,String whichDebt,comment,accept) async {
    var body = {
      "operation_type":type,
      "date": date,
      "client":clientId,
      "wallet":walletId,
      "summa_uzs":summaUzs,
      "summa_usd":summaUsd,
      "which_debt":whichDebt,
      "comment":comment,
      "accepted":accept,
    };
    String url = "$baseUrl/operations/";
    return await _postRequest(url,json.encode(body));
  }


  Future<HttpResult> addExpense(date,walletId,summaUzs,summaUsd, cost,comment) async {
    var body = {
      "operation_type":"xarajat",
      "date": date,
      "wallet":walletId,
      "summa_uzs":summaUzs,
      "summa_usd":summaUsd,
      "cost":cost,
      "comment":comment,
    };
    String url = "$baseUrl/operations/";
    return await _postRequest(url,json.encode(body));
  }


  Future<HttpResult> clientId(id) async {
    String url = "$baseUrl/api/client/$id";
    return await _getRequest(url);
  }
  Future<HttpResult> walletAll() async {
    String url = "$baseUrl/api/wallets";
    return await _getRequest(url);
  }
  Future<HttpResult> courseAll() async {
    String url = "$baseUrl/api/rates";
    return await _getRequest(url);
  }
  Future<HttpResult> incomeAll(date,wallet) async {
    String url = "$baseUrl/operations/?operation_type=kirim&filter_date=$date&wallet=$wallet";
    return await _getRequest(url);
  }
  Future<HttpResult> expenseAll(date,wallet,cost) async {
    String url = "$baseUrl/operations?operation_type=xarajat&filter_date=$date&wallet=$wallet&cost=$cost";
    return await _getRequest(url);
  }
  Future<HttpResult> debtAll(date,wallet) async {
    String url = "$baseUrl/operations?operation_type=chiqim&filter_date=$date&wallet=$wallet";
    return await _getRequest(url);
  }
  Future<HttpResult> courseAdd(date,course) async {
    var body = {
      "reg_date":date,
      "course":course
    };
    String url = "$baseUrl/api/rates";
    return await _postRequest(url,json.encode(body));
  }

  Future<HttpResult> categoryAdd(name) async {
    var body = {
      "name":name,
    };
    String url = "$baseUrl/api/categories";
    return await _postRequest(url,json.encode(body));
  }

  Future<HttpResult> categoryGet() async {
    String url = "$baseUrl/api/categories";
    return await _getRequest(url);
  }
  Future<HttpResult> categoryDelete(id) async {
    String url = "$baseUrl/api/category/$id/delete";
    return await _deleteRequest(url);
  }
  Future<HttpResult> categoryUpdate(id,name) async {
    String url = "$baseUrl/api/category/$id/update";
    var body = {
      "name":name
    };
    return await _putRequest(url,json.encode(body));
  }

  Future<HttpResult> filterDate() async {
    String url = "$baseUrl/api/rates/";
    return await _getRequest(url);
  }
  Future<HttpResult> home() async {
    String url = "$baseUrl/api/home";
    return await _getRequest(url);
  }
  Future<HttpResult> profile() async {
    String url = "$baseUrl/api/get_me";
    return await _getRequest(url);
  }
  Future<HttpResult> addCost(name) async {
    String url = "$baseUrl/api/costs";
    return await _postRequest(url,json.encode({"name":name}));
  }
  Future<HttpResult> updateCost(id,name) async {
    String url = "$baseUrl/api/cost/$id/update";
    return await _putRequest(url,json.encode({"name":name}));
  }
  Future<HttpResult> deleteCost(id) async {
    String url = "$baseUrl/api/cost/$id/delete";
    return await _deleteRequest(url,);
  }
  Future<HttpResult> getCost() async {
    String url = "$baseUrl/api/costs";
    return await _getRequest(url);
  }
  Future<HttpResult> getAgentDetail(id,date) async {
    String url = "$baseUrl/operations/?operation_type=all&client=$id&filter_date=$date";
    return await _getRequest(url);
  }
}