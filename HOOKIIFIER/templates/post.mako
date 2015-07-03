<%inherit file="base.mako"/>

<%
    import HOOKIIFIER.filters as filters
%>

<div class='hookii-article'>
    <h2 style='margin-bottom:0.1em;'>
        <a href='http://www.hookii.it/${post_name}'>${post_title}</a>
    </h2>
    <p style='margin-top:0.1em;'>
        <font size='2'>Comparso il ${post_date} su <a href='http://www.hookii.it/'>hookii.</a></font>
        Vai all'articolo <a href='http://www.hookii.it/${post_name}'>${post_name}</a> per commentare.
    </p>

    <p>
        ${post_content | filters.newline}
    <p>
</div>

<hr>

<h3>
    ${comment_count} ${"commenti" if comment_count != 1 else "commento"}
</h3>

<div class='hookii-comment'>
    % for com in comments:
        <div style="margin-left:${com["level"]*20}px; margin-right:-${com["level"]*20}px; width:80%%;">
            <h4 style='margin-bottom:0.1em;'>
                <a href='http://www.hookii.it/${post_name}/#comment-${com["comment_disqusid"]}'>
                % if "parent_author" not in com:
                    ${com["comment_author"]}
                % else:
                    ${"&#8627; %s &#8614; %s " % (com["comment_author"], com["parent_author"])}
                % endif
                </a>
                <p style='margin-top:0.1em; font-size:80%%'>${com["comment_date"]}</p>
            </h4>
            <p>${com["comment_content"] | filters.url, filters.disqus_user, filters.email_antispam, filters.newline }</p> 
            <hr>
        </div>
    % endfor
</div>