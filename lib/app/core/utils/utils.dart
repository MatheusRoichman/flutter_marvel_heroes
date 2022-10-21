String buildQueryParams(Map<String, dynamic> params) {
  var paramsList = params.entries.map((entry) => "${entry.key}=${entry.value}").toList();

  return paramsList.isEmpty ? "" : "?${paramsList.join("&")}";
}
