class JobOfferResponse {
  late String status;
  late List<JobOfferData> data;

  JobOfferResponse({required this.status, required this.data});

  JobOfferResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? '';
    if (json['data'] != null) {
      data = <JobOfferData>[];
      json['data'].forEach((v) {
        data.add(JobOfferData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    if (this.data.isNotEmpty) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JobOfferData {
  late int idJobOffer;
  late int idCompany;
  late int idCategory;
  late String titleJobOffer;
  late String url;
  late String description;

  JobOfferData({
    required this.idJobOffer,
    required this.idCompany,
    required this.idCategory,
    required this.titleJobOffer,
    required this.url,
    required this.description,
  });

  JobOfferData.fromJson(Map<String, dynamic> json) {
    idJobOffer = json['id_job_offer'] ?? 0;
    idCompany = json['id_company'] ?? 0;
    idCategory = json['id_category'] ?? 0;
    titleJobOffer = json['title_job_offer'] ?? '';
    url = json['URL'] ?? '';
    description = json['description'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_job_offer'] = idJobOffer;
    data['id_company'] = idCompany;
    data['id_category'] = idCategory;
    data['title_job_offer'] = titleJobOffer;
    data['URL'] = url;
    data['description'] = description;
    return data;
  }
}
