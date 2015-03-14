<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="redis.clients.jedis.Jedis" %>
<%@ page import="com.mycompany.app.RedisManager" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
  </head>
  <body>
    <div class=container>
      <h1>Simple Guestbook</h1>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">New Entry</h3>
        </div>
        <div class="panel-body">
          <form role="form" action="add" method=post>
              <div class="form-group">
                <textarea class="form-control" name="entry" id="entry" rows="3"></textarea>
              </div>
              <button type="submit" class="btn btn-primary">Submit</button>
          </form>
        </div>
      </div>
      <ul class="list-group">
      <%
          Jedis jedis = RedisManager.getInstance().getJedis();
          List<String> results = jedis.lrange("entries",0,10);
          for (String e : results) {
      %>
        <li class="list-group-item" class=entry><%=e%></li>
        <% 
         } 
        RedisManager.getInstance().returnJedis(jedis);
        
        %>
      </ul>
      <form role=form action="clear" method=post>
        <button type="submit" class="btn btn-danger">Clear Entries</button>
      </form>
    </div>
  </body>
</html>
