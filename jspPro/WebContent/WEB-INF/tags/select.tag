<%@ tag body-content="empty" pageEncoding="UTF-8" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="name" required="true" %>
<%@ tag dynamic-attributes="optionsMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<select name="${name}">
 <c:forEach items="${optionsMap}" var="op">
  <option value="${op.key}">${op.value}</option>
 </c:forEach>
</select>