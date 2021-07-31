
import 'package:dio/dio.dart';
import 'package:online_shop/app/shoe_shop/model/response_product_model.dart';

class ShoeApiService {


  
  Future<ResponseProduct> getListShoe ()async{
    try {
     // Response response = await _dio.get("https://jsonblob.com/api/jsonBlob/4f488d11-307a-11eb-83d3-1140910d6286");
     // var data = jsonDecode(response.toString());


      return ResponseProduct.fromJson(dataDemo);
    }
    on DioError catch(e){
      if(e.type == DioErrorType.connectTimeout){
        return ResponseProduct(code: "error", msg: "Timeout");
      }
      if(e.type == DioErrorType.receiveTimeout){
        return ResponseProduct(code: "error", msg: "Timeout");
      }
      if(e.response!=null) {
        return ResponseProduct(code: "error", msg:  "Erorr");
      } else{
        return ResponseProduct(code: "error", msg:  e.message);
      }
    }
    
  }

  var dataDemo = {
    "code": "success",
    "msg": "Success!",
    "list": [
      {
        "id": 0,
        "name_category_product": "shoe",
        "id_category_product": 1,
        "url_photo": "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/1baaa1cf-6e08-43f4-b170-a0878ec7e182/kyrie-7-ep-basketball-shoe-kMwm27.jpg",
        "name": "Kyrie 7 EP",
        "price": "166",
        "description": "Kyrie Irving is a creative force on and off the court. He needs his shoes to keep up with his playmaking, but also sync with his boundary-pushing style and ethos. Tuned for the next generation of energy return, control and speed, the Kyrie 7 helps players at all levels take advantage of their quick first step by optimising the shoe's fit, court feel and banking ability.",
        "type": "Basketball Shoe",
        "size": [
          "40",
          "40.5",
          "41",
          "42",
          "42.5",
          "43",
          "43.5",
          "44",
          "44.5",
          "45",
          "45.5",
          "46"
        ],
        "othersImage": [
          {
            "color": "purple",
            "url_photo": [
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/1baaa1cf-6e08-43f4-b170-a0878ec7e182/kyrie-7-ep-basketball-shoe-kMwm27.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/03cf8a53-c2ed-43f5-aa42-71d4f4d1a6da/kyrie-7-ep-basketball-shoe-kMwm27.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/5eee726a-0677-42e2-a070-20131731bf80/kyrie-7-ep-basketball-shoe-kMwm27.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/0890e77d-5bf5-4b0c-abe5-174281438677/kyrie-7-ep-basketball-shoe-kMwm27.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/b2cee0c4-ffa6-4c28-a7b1-e84d8da7426f/kyrie-7-ep-basketball-shoe-kMwm27.jpg"
            ]
          },
          {
            "color": "red",
            "url_photo": [
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/54d0fb0a-bb14-4424-aa7a-fe075927213f/kyrie-7-ep-basketball-shoe-kMwm27.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/0c0f07ed-e614-4fb6-ba00-4ef17cb3e6ab/kyrie-7-ep-basketball-shoe-kMwm27.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/39ed65e4-91a5-4aee-8107-e426dc41214b/kyrie-7-ep-basketball-shoe-kMwm27.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/0d806e02-12e5-413d-8e4a-ea646695b31b/kyrie-7-ep-basketball-shoe-kMwm27.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/eeab3120-7230-4b69-b5c3-4c3083e2c433/kyrie-7-ep-basketball-shoe-kMwm27.jpg"
            ]
          }
        ]
      },
      {
        "id": 1,
        "name_category_product": "shoe",
        "id_category_product": 1,
        "url_photo": "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/e22f5463-2687-42fd-a6e4-27e90c206200/kyrie-7-ep-basketball-shoe-8ZrrMn.jpg",
        "name": "Kyrie 7 EP 'Sisterhood'",
        "price": "166",
        "description": "Kyrie made headlines with his generous, outspoken support of female ballers. Nike is joining him with the special 'Sisterhood' colourway of the Kyrie 7 EP, which aims to empower and unify support for women athletes everywhere. The eye-grabbing aesthetic is highlighted by a detailed floral graphic underneath the pop of its yellow-outlined Swoosh logo. On or off the court, show your support for women athletes in style. This EP version uses an extra-durable outsole that's ideal for outdoor courts.",
        "type": "Basketball Shoe",
        "size": [
          "40",
          "40.5",
          "41",
          "42",
          "42.5",
          "43",
          "43.5",
          "44",
          "44.5",
          "45",
          "45.5",
          "46"
        ],
        "othersImage": [
          {
            "color": "black",
            "url_photo": [
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/e22f5463-2687-42fd-a6e4-27e90c206200/kyrie-7-ep-basketball-shoe-8ZrrMn.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/606d39f8-9093-4d72-b75d-b514827297c2/kyrie-7-ep-basketball-shoe-8ZrrMn.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/127615a3-62ac-48fc-9c5b-a688485d80bc/kyrie-7-ep-basketball-shoe-8ZrrMn.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/af4f234e-bc63-4fa4-8680-6c25a04b9507/kyrie-7-ep-basketball-shoe-8ZrrMn.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/29c6fed0-daa7-4519-ba76-32dcc4774a7f/kyrie-7-ep-basketball-shoe-8ZrrMn.jpg"
            ]
          },
          {
            "color": "blue",
            "url_photo": [
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/f8c6f043-e73e-45b0-8d86-d29d3f05856a/kyrie-7-ep-sisterhood-basketball-shoe-8ZrrMn.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/e6dc7281-71d2-43db-b9c5-7203e1230f11/kyrie-7-ep-sisterhood-basketball-shoe-8ZrrMn.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/e51fd962-be8e-45f3-be69-e88b28c6c60b/kyrie-7-ep-sisterhood-basketball-shoe-8ZrrMn.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/3d1e0ce9-4c9d-4bfe-a975-b4fced50e328/kyrie-7-ep-sisterhood-basketball-shoe-8ZrrMn.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/3d1e0ce9-4c9d-4bfe-a975-b4fced50e328/kyrie-7-ep-sisterhood-basketball-shoe-8ZrrMn.jpg"
            ]
          }
        ]
      },
      {
        "id": 2,
        "name_category_product": "shoe",
        "id_category_product": 1,
        "url_photo": "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/e26c3527-0cca-4502-971a-9cc07ffb2440/air-force-1-crater-shoe-Z7JHnk.jpg",
        "name": "Nike Air Force 1 Crater",
        "price": "140",
        "description": "The sneakers that helped define street style are re-imagined with Crater Foam, weighing in with at least 20% recycled materials. The super-soft Crater Foam midsole is made from a spacey mix of approximately 11% Nike Grind rubber and foam materials. With a speckled outsole made from 15% Nike Grind rubber, each pair of the Nike Air Force 1 Crater is unique and durable.",
        "type": "Men's Shoe",
        "size": [
          "40",
          "40.5",
          "41",
          "42",
          "42.5",
          "43",
          "43.5",
          "44",
          "44.5",
          "45",
          "45.5",
          "46"
        ],
        "othersImage": [
          {
            "color": "white",
            "url_photo": [
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/e26c3527-0cca-4502-971a-9cc07ffb2440/air-force-1-crater-shoe-Z7JHnk.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/1c7c4742-b498-465e-8e08-22b6bdf8423a/air-force-1-crater-shoe-Z7JHnk.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/e203472d-15a4-46bb-916f-0b9fe933025b/air-force-1-crater-shoe-Z7JHnk.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/6d103983-44fe-452a-b844-d84e1d762ef9/air-force-1-crater-shoe-Z7JHnk.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6859da37-1f90-4e38-89cd-9e9f1573c49a/air-force-1-crater-shoe-Z7JHnk.jpg"
            ]
          },
          {
            "color": "black",
            "url_photo": [
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/7813b261-e3b2-4aae-8ecb-f7741f335384/air-force-1-crater-shoe-Z7JHnk.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/8bc8a3f8-c9eb-4b91-b8bb-05b68a6e5b12/air-force-1-crater-shoe-Z7JHnk.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/79bec8cc-6a60-4afd-8d78-53ee6bdbf0fc/air-force-1-crater-shoe-Z7JHnk.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/1cd4abd4-096b-47e1-95db-dac387ff660c/air-force-1-crater-shoe-Z7JHnk.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/4f5db5b2-e8ba-4458-b32c-475b83336fa8/air-force-1-crater-shoe-Z7JHnk.jpg"
            ]
          }
        ]
      },
      {
        "id": 3,
        "name_category_product": "shoe",
        "id_category_product": 1,
        "url_photo": "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/59b4a0e0-79ab-4803-8301-f804dd50e240/jordan-delta-shoe-mBgHNX.jpg",
        "name": "Jordan Delta",
        "price": "178",
        "description": "The Jordan Delta is a versatile shoe that's comfortable from the inside out. Mixing high-tech and premium materials, it's plush, lightweight and crafted with an array of details.",
        "type": "Men's Shoe",
        "size": [
          "40",
          "40.5",
          "41",
          "42",
          "42.5",
          "43",
          "43.5",
          "44",
          "44.5",
          "45",
          "45.5",
          "46"
        ],
        "othersImage": [
          {
            "color": "black",
            "url_photo": [
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/59b4a0e0-79ab-4803-8301-f804dd50e240/jordan-delta-shoe-mBgHNX.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/8f3579cc-cce1-4dce-b911-2dfb10d93556/jordan-delta-shoe-mBgHNX.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/d2905009-c81f-49cc-a98e-2ffa9358e650/jordan-delta-shoe-mBgHNX.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/5a6aec15-4a8d-45da-851c-dd60df9a86bc/jordan-delta-shoe-mBgHNX.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/27b380a9-d406-4800-9a6e-6cac623f7722/jordan-delta-shoe-mBgHNX.jpg"
            ]
          }
        ]
      },
      {
        "id": 4,
        "name_category_product": "shoe",
        "id_category_product": 1,
        "url_photo": "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/1367bf94-afa0-464e-bae6-a36e20602daa/air-zoom-bb-nxt-basketball-shoe-wRmJMz.jpg",
        "name": "Nike Air Zoom BB NXT",
        "price": "229",
        "description": "Keep your focus on the game in the new Air Zoom BB NXT from Nike Basketball. It's designed to help players feel light, secure and responsive. You get energy back with every step, helping to turn your force into momentum when it matters most.",
        "type": "Basketball Shoe",
        "size": [
          "40",
          "40.5",
          "41",
          "42",
          "42.5",
          "43",
          "43.5",
          "44",
          "44.5",
          "45",
          "45.5",
          "46"
        ],
        "othersImage": [
          {
            "color": "white",
            "url_photo": [
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/1367bf94-afa0-464e-bae6-a36e20602daa/air-zoom-bb-nxt-basketball-shoe-wRmJMz.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/6fcbe9ce-8912-4b2c-a65b-bc84122f3b99/air-zoom-bb-nxt-basketball-shoe-wRmJMz.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/d848643c-f40d-42a5-87e8-8bff92fb3d9c/air-zoom-bb-nxt-basketball-shoe-wRmJMz.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/43b69760-ea9f-4a64-8ea1-1d568983c680/air-zoom-bb-nxt-basketball-shoe-wRmJMz.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/5b82f2da-744e-40e6-80f5-92358f479952/air-zoom-bb-nxt-basketball-shoe-wRmJMz.jpg"
            ]
          },
          {
            "color": "black",
            "url_photo": [
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/6ff2a5cf-bed6-4ef5-b22b-6ecc35455aa8/air-zoom-bb-nxt-basketball-shoe-wRmJMz.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/60a0d12e-3160-4649-a950-6695fef2deb9/air-zoom-bb-nxt-basketball-shoe-wRmJMz.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/59a8dafd-38b5-4b5f-a008-58333550c353/air-zoom-bb-nxt-basketball-shoe-wRmJMz.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/8e8f8855-51b9-4279-b0ad-650316341b37/air-zoom-bb-nxt-basketball-shoe-wRmJMz.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/8e52a15d-76ca-49ea-8566-60f751c3ecc4/air-zoom-bb-nxt-basketball-shoe-wRmJMz.jpg"
            ]
          }
        ]
      },
      {
        "id": 5,
        "name_category_product": "shoe",
        "id_category_product": 1,
        "url_photo": "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/b1bd3b36-1dfe-46cf-b703-0039bb70aad8/air-jordan-xxxv-pf-basketball-shoe-QrRrHz.jpg",
        "name": "Air Jordan XXXV PF",
        "price": "223",
        "description": "The lighter the shoe, the less weight to carry, the faster players can go. Evolving last year's release, the Air Jordan XXXV features a stabilising Eclipse plate 2.0, visible cushioning and new Flightwire cables. Lightweight and responsive, it's designed to help players get the most from their power and athleticism. This PF version uses an extra-durable outsole that's ideal for outdoor courts.",
        "type": "Basketball Shoe",
        "size": [
          "40",
          "40.5",
          "41",
          "42",
          "42.5",
          "43",
          "43.5",
          "44",
          "44.5",
          "45",
          "45.5",
          "46"
        ],
        "othersImage": [
          {
            "color": "black",
            "url_photo": [
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/b1bd3b36-1dfe-46cf-b703-0039bb70aad8/air-jordan-xxxv-pf-basketball-shoe-QrRrHz.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/6c8abd25-2183-4a25-908c-2246315cba76/air-jordan-xxxv-pf-basketball-shoe-QrRrHz.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/6628df85-1647-40d4-b430-4c4cba8e4d6a/air-jordan-xxxv-pf-basketball-shoe-QrRrHz.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/9c51113e-c79f-4191-9b12-d11f84cdf57d/air-jordan-xxxv-pf-basketball-shoe-QrRrHz.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/9896b12f-1120-47fb-8a73-765b60708f32/air-jordan-xxxv-pf-basketball-shoe-QrRrHz.jpg"
            ]
          }
        ]
      },
      {
        "id": 6,
        "name_category_product": "shoe",
        "id_category_product": 1,
        "url_photo": "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/33b5d9f9-c639-4d34-9da9-7fe507235e35/blazer-mid-77-infinite-shoe-dCp5Mm.jpg",
        "name": "Nike Blazer Mid '77 Infinite",
        "price": "140",
        "description": "The Nike Blazer Mid '77 Infinite toughens up the old-school, b-ball icon that has become the go-to of the streets. Durable rubber details on the toe, heel and side let you take it where you want, day in and day out, while the piping and distorted Swoosh logo add a modern touch.",
        "type": "Men's Shoe",
        "size": [
          "40",
          "40.5",
          "41",
          "42",
          "42.5",
          "43",
          "43.5",
          "44",
          "44.5",
          "45",
          "45.5",
          "46"
        ],
        "othersImage": [
          {
            "color": "orange",
            "url_photo": [
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/33b5d9f9-c639-4d34-9da9-7fe507235e35/blazer-mid-77-infinite-shoe-dCp5Mm.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/5b95dcd7-74b0-44f7-8b8e-44bcafbcd7bb/blazer-mid-77-infinite-shoe-dCp5Mm.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/e3735bf1-2f04-4413-a4e9-23ba1f89241a/blazer-mid-77-infinite-shoe-dCp5Mm.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/970c7551-3a0c-43c6-8da6-6079043a6d1f/blazer-mid-77-infinite-shoe-dCp5Mm.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/2340a135-7ed2-4d50-8c2d-ac68d664bd63/blazer-mid-77-infinite-shoe-dCp5Mm.jpg"
            ]
          },
          {
            "color": "white",
            "url_photo": [
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/9024868d-598b-48bf-8605-1a49df79a725/blazer-mid-77-infinite-shoe-dCp5Mm.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/4f4785f6-d122-4ee2-9274-2d3c12611a33/blazer-mid-77-infinite-shoe-dCp5Mm.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/4fa24ecf-0f12-42cd-8668-feb65bc17b7c/blazer-mid-77-infinite-shoe-dCp5Mm.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/ca9d1884-aeed-4dc2-a15e-f4b54d80c57e/blazer-mid-77-infinite-shoe-dCp5Mm.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/050ad745-6f85-4000-a6fe-287da86738da/blazer-mid-77-infinite-shoe-dCp5Mm.jpg"
            ]
          }
        ]
      },
      {
        "id": 7,
        "name_category_product": "shoe",
        "id_category_product": 1,
        "url_photo": "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/b1a99d95-7b76-4df8-950a-2b89a5aef783/air-max-1-shoe-SS9rJG.jpg",
        "name": "Nike Air Max 1",
        "price": "178",
        "description": "The Nike Air Max 1 reboots the legendary design that has reigned supreme since 1987. Crossing street fashion with sport, it takes the same lightweight cushioning and classic silhouette of the OG and boldly reworks it with salvaged materials, fresh colours and exposed stitching.",
        "type": "Men'shoe",
        "size": [
          "40",
          "40.5",
          "41",
          "42",
          "42.5",
          "43",
          "43.5",
          "44",
          "44.5",
          "45",
          "45.5",
          "46"
        ],
        "othersImage": [
          {
            "color": "white",
            "url_photo": [
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/b1a99d95-7b76-4df8-950a-2b89a5aef783/air-max-1-shoe-SS9rJG.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/19358435-b3ba-4912-8e29-a255cc371fb5/air-max-1-shoe-SS9rJG.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/ca61ecaf-62f5-4dc4-aba7-e304cf66189f/air-max-1-shoe-SS9rJG.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/6cbd50a1-739f-4192-852b-69f16136e1c4/air-max-1-shoe-SS9rJG.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/75b7368c-8873-4662-9f89-157bd2cfb97f/air-max-1-shoe-SS9rJG.jpg"
            ]
          }
        ]
      },
      {
        "id": 8,
        "name_category_product": "shoe",
        "id_category_product": 1,
        "url_photo": "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/5607fc07-c44d-467d-9fb4-440981f6affc/air-max-95-essential-shoe-R8WBq5.jpg",
        "name": "Nike Air Max 95 Essential",
        "price": "204",
        "description": "Taking inspiration from the human body and running DNA, the Nike Air Max 95 Essential mixes unbelievable comfort with head-turning style. The iconic side panels represent muscles while visible Nike Air in the heel and forefoot cushions your every step.",
        "type": "Men's Shoe",
        "size": [
          "40",
          "40.5",
          "41",
          "42",
          "42.5",
          "43",
          "43.5",
          "44",
          "44.5",
          "45",
          "45.5",
          "46"
        ],
        "othersImage": [
          {
            "color": "orange",
            "url_photo": [
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/5607fc07-c44d-467d-9fb4-440981f6affc/air-max-95-essential-shoe-R8WBq5.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/193c516e-463b-4a8f-b759-a49b03382c3d/air-max-95-essential-shoe-R8WBq5.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/ed81acdc-ca59-4723-8d79-5325b6f9f0ca/air-max-95-essential-shoe-R8WBq5.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/de3e4af2-0497-4dab-814a-732f6e4a24fc/air-max-95-essential-shoe-R8WBq5.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/f7f48a7d-48ac-476c-9837-d660261639b3/air-max-95-essential-shoe-R8WBq5.jpg"
            ]
          },
          {
            "color": "black",
            "url_photo": [
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/5ce15836-07ae-454a-99b3-12a47f3c9e56/air-max-95-essential-shoe-R8WBq5.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/dd4f46b4-1ae4-4bfe-a762-bfbf292a63f9/air-max-95-essential-shoe-R8WBq5.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/c7daae13-97cc-407e-8ac7-5c349506290e/air-max-95-essential-shoe-R8WBq5.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/716c468d-183f-4f66-83a4-98924e434915/air-max-95-essential-shoe-R8WBq5.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/9b91a360-9304-4d2f-9839-4cb21f86d896/air-max-95-essential-shoe-R8WBq5.jpg"
            ]
          }
        ]
      },
      {
        "id": 9,
        "name_category_product": "shoe",
        "id_category_product": 1,
        "url_photo": "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/1f244790-42ef-47da-9546-86e7bba12f45/air-zoom-tempo-next-running-shoe-chNfdw.jpg",
        "name": "Nike Air Zoom Tempo NEXT%",
        "price": "255",
        "description": "The Nike Air Zoom Tempo NEXT% mixes durability with a design that helps push you towards your personal best. The result is a shoe built like a racer, but made for your everyday training routine.",
        "type": "Men's Running Shoe",
        "size": [
          "40",
          "40.5",
          "41",
          "42",
          "42.5",
          "43",
          "43.5",
          "44",
          "44.5",
          "45",
          "45.5",
          "46"
        ],
        "othersImage": [
          {
            "color": "blue",
            "url_photo": [
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/1f244790-42ef-47da-9546-86e7bba12f45/air-zoom-tempo-next-running-shoe-chNfdw.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/a23aa035-2937-43cf-b018-5c1fdd79a965/air-zoom-tempo-next-running-shoe-chNfdw.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/990d4798-9ffa-4d0c-a77c-750903cbf43c/air-zoom-tempo-next-running-shoe-chNfdw.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/2209f572-64bc-4083-914f-21dd42d12971/air-zoom-tempo-next-running-shoe-chNfdw.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/a353a9f7-eb58-47ed-968e-f69c5a75a9c4/air-zoom-tempo-next-running-shoe-chNfdw.jpg"
            ]
          },
          {
            "color": "white",
            "url_photo": [
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/b07db7e2-8757-4e79-b33a-feed507251f8/air-zoom-tempo-next-running-shoe-chNfdw.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/d7e3b7be-6163-433e-9e82-8cf4fe4af473/air-zoom-tempo-next-running-shoe-chNfdw.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/38e9a6fb-c745-4a8d-9a52-8c7dcf3c1dd1/air-zoom-tempo-next-running-shoe-chNfdw.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/2764e2d8-7d69-4bd2-8c86-1db7d0328476/air-zoom-tempo-next-running-shoe-chNfdw.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/5089d0fb-86f4-41e4-ab26-5b7dc365eba1/air-zoom-tempo-next-running-shoe-chNfdw.jpg"
            ]
          },
          {
            "color": "orange",
            "url_photo": [
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/d5b9a87a-6e52-4fda-a9e0-9586ed0ad9fa/air-zoom-tempo-next-running-shoe-chNfdw.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/124991e2-6bc8-4537-852d-da3f167af217/air-zoom-tempo-next-running-shoe-chNfdw.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/d83e3f5d-7880-44f4-94e9-2395cc514ab3/air-zoom-tempo-next-running-shoe-chNfdw.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/de533ee6-62d3-4755-aedf-3bd1982b1e9e/air-zoom-tempo-next-running-shoe-chNfdw.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/478035f3-8226-4c86-a0af-1e4796f737ce/air-zoom-tempo-next-running-shoe-chNfdw.jpg"
            ]
          }
        ]
      },
      {
        "id": 10,
        "name_category_product": "shoe",
        "id_category_product": 1,
        "url_photo": "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/a639f8e9-bdc2-4e24-88cf-9d56a2f81574/air-zoom-tempo-next-flyease-running-shoe-40pJSQ.jpg",
        "name": "Nike Air Zoom Tempo Next% FlyEase",
        "price": "255",
        "description": "The ultra-responsive Nike Air Zoom Tempo Next% FlyEase is designed to help you get the most from your training runs, so you can go confidently into your next (or first) race. It has a step-in entry and an internal lacing mechanism you operate with one hand. Pull one loop to tighten, another to release.",
        "type": "Men's Running Shoe",
        "size": [
          "40",
          "40.5",
          "41",
          "42",
          "42.5",
          "43",
          "43.5",
          "44",
          "44.5",
          "45",
          "45.5",
          "46"
        ],
        "othersImage": [
          {
            "color": "black",
            "url_photo": [
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/a639f8e9-bdc2-4e24-88cf-9d56a2f81574/air-zoom-tempo-next-flyease-running-shoe-40pJSQ.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/fbe722cc-b670-4519-be66-e0605d22baa7/air-zoom-tempo-next-flyease-running-shoe-40pJSQ.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/6af2bfa4-8264-45dd-ad1e-096b28e0e96e/air-zoom-tempo-next-flyease-running-shoe-40pJSQ.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/f1a42f88-71f1-434f-b2e9-92306119076e/air-zoom-tempo-next-flyease-running-shoe-40pJSQ.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/ce63c325-0563-47b0-ab46-5de8859eb42c/air-zoom-tempo-next-flyease-running-shoe-40pJSQ.jpg"
            ]
          }
        ]
      },
      {
        "id": 11,
        "name_category_product": "shoe",
        "id_category_product": 1,
        "url_photo": "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/3fc45e78-493a-4628-ba86-e8291233ba7d/air-max-270-react-rs-shoe-LFF98p.jpg",
        "name": "Nike Air Max 270 React RS",
        "price": "204",
        "description": "Meet the softest, smoothest, most resilient foam yet in the Nike Air Max 270 React. One of Nike's first lifestyle Air Max models, its design draws inspiration from the Nike Pantheon. The shoe helps showcase one of Nike's greatest innovations yet thanks to its large window and fresh array of colours",
        "type": "Men's Shoe",
        "size": [
          "40",
          "40.5",
          "41",
          "42",
          "42.5",
          "43",
          "43.5",
          "44",
          "44.5",
          "45",
          "45.5",
          "46"
        ],
        "othersImage": [
          {
            "color": "white",
            "url_photo": [
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/3fc45e78-493a-4628-ba86-e8291233ba7d/air-max-270-react-rs-shoe-LFF98p.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/f8da63e7-18f6-4130-ba82-d6e0f8d97d64/air-max-270-react-rs-shoe-LFF98p.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/6837cad3-2099-47a5-b114-be19cfc20676/air-max-270-react-rs-shoe-LFF98p.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/6a5d52c5-cea6-4caf-992f-d55ed5f1fac4/air-max-270-react-rs-shoe-LFF98p.jpg",
              "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/771b264a-66f1-47c2-861c-cfd56fe41cc4/air-max-270-react-rs-shoe-LFF98p.jpg"
            ]
          }
        ]
      }
    ]
  };
}