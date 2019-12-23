$(document).ready(function(){
  function score_indicate(){

    let subject_points = [Number($('#national_language').val()),
                          Number($('#english').val()),
                          Number($('#mathematics').val()),
                          Number($('#science').val()),
                          Number($('#society').val())
                          ];


    let sum = subject_points.reduce((prev, current, index, array)=>{
      console.log(prev, current, index, array);
      return prev + current;
    },0);

    $("#sum_indicate").text(sum);

    $("#average_indicate").text(sum/5);
  };

  function get_achievement(){

    let subject_points = [Number($('#national_language').val()),
                          Number($('#english').val()),
                          Number($('#mathematics').val()),
                          Number($('#science').val()),
                          Number($('#society').val())
                          ];


    function achievement(){
      let sum = 0;
      for(let i =0; i < subject_points.length; i++){
        sum = sum + subject_points[i];
      }

      if(sum>=subject_points.length*100*0.8){
        return "A";
      } else if (sum>=subject_points.length*100*0.6) {
        return "B";
      } else if (sum>=subject_points.length*100*0.4) {
        return "C";
      } else {
        return "D";
      }
    }

    $("#evaluation").text(achievement);
  }


  function get_pass_or_failure(){

    let subject_points = [Number($('#national_language').val()),
                          Number($('#english').val()),
                          Number($('#mathematics').val()),
                          Number($('#science').val()),
                          Number($('#society').val())
                          ];
    function failure(){
      let judge = "合格";
      for(let i =0; i < subject_points.length; i++){
        if(subject_points[i]<60){
          judge= "不合格";
          break;
        }
      }
    return judge;
    }
    $("#judge").text(failure);
  }

  function judgement(){

    const lists = document.getElementById("declaration");
    while(lists.firstChild){
      lists.removeChild(lists.firstChild);
    }

    let achievement = $("#evaluation").text();
    let pass_or_failure = $("#judge").text();
    $('#declaration').append(`<label id="alert-indicate" class="alert alert-info">あなたの成績は${achievement}です。${pass_or_failure}です</label>`);
  };

  $('#national_language, #english, #mathematics, #science, #society').change(function() {
    score_indicate();
  });

  $('#btn-evaluation').click(function() {
    get_achievement();
  });

  $('#btn-judge').click(function() {
    get_pass_or_failure();
  });

  $('#btn-declaration').click(function() {
    judgement();
  });
});

// ① $(document).ready(function(){ ~ });
// 画像などを除いて、HTML=DOMの読み込みが終わったらfunction()の中の処理を実行する。
// ② $('#btn-evaluation').click(function() { ~ });
// btn-evaluationのID属性を持つ要素をクリックすると、function()の中の処理を実行する。
// ③ $('#national_language, #english, #mathematics, #science, #society').change(function() { ~ });
// national_language, english, mathematics, science, societyのID属性を持つ要素の中身が変更された際、function()の中の処理を実行する。
// ④ $('#national_language').val()
// national_languageのIDを持つ要素のvalue属性を取得する。
// ⑤ Number()
// 引数を数値に変換する。
// ⑥ $("#sum_indicate").text(sum);
// sum_indicateのIDを持つ要素に対して、引数sumのテキスト情報を追加する。
// ⑦ .append
// .の前で指定されたID/クラス/タグ等に対し、appendの後に記載された()内のhtml要素を追加する。
