{%- macro classify_referrer(source, medium) -%}

    case
        when {{ medium }} = 'organic' then '検索エンジン'
        when {{ source }} = 'spider-man-tm.github.io' then 'My Website'
        when {{ source }} like '%github%' then 'GitHub'
        when {{ source }} in ('(direct)', '') or {{ source }} is null then 'Discover・不明'
        when {{ source }} in ('headlines.yahoo.co.jp', 'news.yahoo.co.jp') then 'Yahoo!ニュース'
        when {{ source }} = 'smartnews.com' then 'SmartNews'
        when {{ source }} = 'news.line.me' then 'LinE NEWS'
        when {{ source }} = 'gunosy.com' then 'Gunosy'
        when {{ source }} = 'news.google.com' then 'Google ニュース'
        when {{ source }} in ('news.livedoor.com', 'news.goo.ne.jp', 'topics.smt.docomo.ne.jp', 'docomo.ne.jp', 'news.nifty.com', 'article.auone.jp', 'msn.com', 'news.infoseek.co.jp') then 'ポータルサイト'
        when {{ source }} in ('twitter.com', 't.co') then 'Twitter'
        when {{ source }} in ('facebook.com', 'm.facebook.com', 'newspicks.com', 'b.hatena.ne.jp', 'blog.livedoor.jp') then 'SNS'
        when {{ source }} = 'push' then 'PUSH通知'
        when REGEXP_CONTAinS({{ source }}, r"ampproject") then 'AMP'
        else 'その他'
    end

{%- endmacro -%}