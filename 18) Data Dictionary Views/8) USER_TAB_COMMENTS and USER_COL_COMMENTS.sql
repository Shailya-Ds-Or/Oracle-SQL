SELECT * FROM USER_TAB_COMMENTS;

select * from user_tab_comments
where upper(comments) like '%EMPLOYEE%';

select * from user_tab_comments
where upper(comments) like '%SALARY%';

select * from user_col_comments;

select * from user_col_comments
where upper(comments) like '%SALARY%';