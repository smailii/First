<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="props.my"/>

<HTML>
<HEAD><TITLE>Web File Browser</TITLE>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</HEAD>
<BODY>
<table>
    <tr>
        <th align="left" colspan="2">
            <c:choose>
                <c:when test="${sortByNameParameter != null}">
                    <a href='?path=<c:out value="${curDirAbsPath}"/>&sortByName=<c:out value="${sortByNameParameter}"/>'>
                        <b>Name</b></a>
                    <c:if test="${sortByNameParameter == 'true'}">
                        <img width="12" height="15" src="${pageContext.request.contextPath}/image/up.png"/>
                    </c:if>
                    <c:if test="${sortByNameParameter == 'false'}">
                        <img width="12" height="15" src="${pageContext.request.contextPath}/image/down.png"/>
                    </c:if>
                </c:when>
                <c:otherwise>
                    <a href='?path=<c:out value="${curDirAbsPath}"/>&sortByName=false'><b>Name</b></a>
                </c:otherwise>
            </c:choose>
        </th>
        <th align="center">
            <c:choose>
                <c:when test="${sortByDirectoryParameter != null}">
                    <a href='?path=<c:out value="${curDirAbsPath}"/>&sortByDer=<c:out value="${sortByDirectoryParameter}"/>'>
                        <b>DirFile</b></a>
                    <c:if test="${sortByDirectoryParameter == 'true'}">
                        <img id="imageUpSort" width="12" height="15"
                             src="${pageContext.request.contextPath}/image/up.png"/>
                    </c:if>
                    <c:if test="${sortByDirectoryParameter == 'false'}">
                        <img id="imageDownSort" width="12" height="15"
                             src="${pageContext.request.contextPath}/image/down.png"/>
                    </c:if>
                </c:when>
                <c:otherwise>
                    <a href='?path=<c:out value="${curDirAbsPath}"/>&sortByDer=false'><b>DirFile</b></a>
                </c:otherwise>
            </c:choose>
        </th>
        <th align="center">
            <c:choose>
                <c:when test="${sortBySizeParameter != null}">
                    <a href='?path=<c:out value="${curDirAbsPath}"/>&sortBySize=<c:out value="${sortBySizeParameter}"/>'>
                        <b>Size</b></a>
                    <c:if test="${sortBySizeParameter == 'true'}">
                        <img width="12" height="15" src="${pageContext.request.contextPath}/image/up.png"/>
                    </c:if>
                    <c:if test="${sortBySizeParameter == 'false'}">
                        <img width="12" height="15" src="${pageContext.request.contextPath}/image/down.png"/>
                    </c:if>
                </c:when>
                <c:otherwise>
                    <a href='?path=<c:out value="${curDirAbsPath}"/>&sortBySize=false'><b>Size</b></a>
                </c:otherwise>
            </c:choose>
        </th>
        <th align="center">
            <c:choose>
                <c:when test="${sortByDateCreateParameter != null}">
                    <a href='?path=<c:out value="${curDirAbsPath}"/>&sortByDate=<c:out value="${sortByDateCreateParameter}"/>'>
                        <b>Date</b></a>
                    <c:if test="${sortByDateCreateParameter == 'true'}">
                        <img width="12" height="15" src="${pageContext.request.contextPath}/image/up.png"/>
                    </c:if>
                    <c:if test="${sortByDateCreateParameter == 'false'}">
                        <img width="12" height="15" src="${pageContext.request.contextPath}/image/down.png"/>
                    </c:if>
                </c:when>
                <c:otherwise>
                    <a href='?path=<c:out value="${curDirAbsPath}"/>&sortByDate=false'><b>Date</b></a>
                </c:otherwise>
            </c:choose>
        </th>
    </tr>
    <tr>
        <td colspan="5"><a href='?path=<c:out value="${backUrl}"/>'><b>..</b></a></td>
    </tr>
    <c:forEach items="${files}" var="entry">
        <tr>
            <c:choose>
                <c:when test="${entry.file.directory}">
                    <td><img src="${pageContext.request.contextPath}/image/folder.svg"/></td>
                    <td><a href='?path=<c:out value="${entry.file.absolutePath}"/>'><span id="nameFolder"><c:out
                            value="${entry.file.name}"/></span></a></td>
                    <td><fmt:message key="Directory"/></td>
                    <td align="center">...</td>
                    <td><fmt:formatDate value="${entry.date}" pattern="d-MMM-YYYY h:m:s"/></td>
                </c:when>
                <c:when test="${entry.file.file}">
                    <td><img src="${pageContext.request.contextPath}/image/empty.svg"/></td>
                    <td><a href='?path=<c:out value="${entry.file.absolutePath}"/>'> <c:out
                            value="${entry.file.name}"/></a></td>
                    <td>File</td>
                    <td><c:out value="${entry.size}"/> kB</td>
                    <td><fmt:formatDate value="${entry.date}" pattern="d-MMM-YYYY h:m:s"/></td>
                </c:when>
            </c:choose>
        </tr>
    </c:forEach>
</table>
</body>
</html>