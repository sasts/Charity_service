<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="pl">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  </head>
  <body>
    <header class="header--form-page">
      <nav class="container container--70">
        <ul class="nav--actions">
          <li class="logged-user">
            Witaj Agata
            <ul class="dropdown">
              <li><a href="#">Profil</a></li>
              <li><a href="#">Ustawienia</a></li>
              <li><a href="#">Moje zbiórki</a></li>
              <li><a href="#">Wyloguj</a></li>
            </ul>
          </li>
        </ul>

        <ul>
          <li><a href="<c:url value="/"/>" class="btn btn--without-border active">Start</a></li>
          <li><a href="<c:url value="/#steps"/>" class="btn btn--without-border">O co chodzi?</a></li>
          <li><a href="<c:url value="/#about-us"/>" class="btn btn--without-border">O nas</a></li>
          <li><a href="<c:url value="/#help"/>" class="btn btn--without-border">Fundacje i organizacje</a></li>
          <li><a href="<c:url value="/#contact"/>" class="btn btn--without-border">Kontakt</a></li>
        </ul>
      </nav>

      <div class="slogan container container--90">
        <div class="slogan--item">
          <h1>
            Oddaj rzeczy, których już nie chcesz<br />
            <span class="uppercase">potrzebującym</span>
          </h1>

          <div class="slogan--steps">
            <div class="slogan--steps-title">Wystarczą 4 proste kroki:</div>
            <ul class="slogan--steps-boxes">
              <li>
                <div><em>1</em><span>Wybierz rzeczy</span></div>
              </li>
              <li>
                <div><em>2</em><span>Spakuj je w worki</span></div>
              </li>
              <li>
                <div><em>3</em><span>Wybierz fundację</span></div>
              </li>
              <li>
                <div><em>4</em><span>Zamów kuriera</span></div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </header>

    <section class="form--steps">
      <div class="form--steps-instructions">
        <div class="form--steps-container">
          <h3>Ważne!</h3>
          <p data-step="1" class="active">
            Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
            wiedzieć komu najlepiej je przekazać.
          </p>
          <p data-step="2">
            Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
            wiedzieć komu najlepiej je przekazać.
          </p>
          <p data-step="3">
           Wybierz jedną, do
            której trafi Twoja przesyłka.
          </p>
          <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
      </div>

      <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>

        <form:form method="post" action="/donation" modelAttribute="donation" id="donationForm">

          <!-- STEP 1: class .active is switching steps -->
          <div data-step="1" class="active">
            <h3>Zaznacz co chcesz oddać:</h3>

            <c:forEach items="${categories}" var="category">
              <div class="form-group form-group--checkbox">
                <label>
                  <input type="checkbox" name="categories" value="${category.id}">
                  <span class="checkbox"></span>
                  <span class="description">${category.name}</span>
                </label>
              </div>
            </c:forEach>

            <div class="form-group form-group--buttons">
              <button type="button" class="btn next-step">Dalej</button>
            </div>
          </div>

          <!-- STEP 2 -->
          <div data-step="2">
            <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

            <div class="form-group form-group--inline">
              <label>
                Liczba 60l worków:
                <form:input path="quantity" type="number" step="1" min="1" id="bags" value=""/>
              </label>
            </div>

            <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="button" class="btn next-step">Dalej</button>
            </div>
          </div>

          <!-- STEP 3 -->
          <div data-step="3">
            <h3>Wybierz organizację, której chcesz pomóc:</h3>

            <c:forEach items="${institutions}" var="institution">
              <div class="form-group form-group--checkbox">
                <label>
                  <input type="radio" name="institution.id" value="${institution.id}">
                  <span class="checkbox radio"></span>
                  <span class="description">
                    <div class="title">Fundacja "${institution.name}"</div>
                    <div class="subtitle">Cel i misja: ${institution.description}</div>
                  </span>
                </label>
              </div>
            </c:forEach>

            <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="button" class="btn next-step">Dalej</button>
            </div>
          </div>

          <!-- STEP 4 -->
          <div data-step="4">
            <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

            <div class="form-section form-section--columns">
              <div class="form-section--column">
                <h4>Adres odbioru</h4>
                <div class="form-group form-group--inline">
                  <label> Ulica <form:input path="street" id="street"/> </label>
                </div>

                <div class="form-group form-group--inline">
                  <label> Miasto <form:input path="city" id="city"/> </label>
                </div>

                <div class="form-group form-group--inline">
                  <label>
                    Kod pocztowy <form:input path="zipCode" id="zipCode"/>
                  </label>
                </div>

                <div class="form-group form-group--inline">
                  <label>
                    Numer telefonu <form:input path="phone" id="phone"/>
                  </label>
                </div>
              </div>

              <div class="form-section--column">
                <h4>Termin odbioru</h4>
                <div class="form-group form-group--inline">
                  <label> Data <form:input path="pickUpDate" type="date" id="date"/> </label>
                </div>

                <div class="form-group form-group--inline">
                  <label> Godzina <form:input path="pickUpTime" type="time" id="time"/> </label>
                </div>

                <div class="form-group form-group--inline">
                  <label>
                    Uwagi dla kuriera
                    <form:textarea path="pickUpComment" id="comment"/>
                  </label>
                </div>
              </div>
            </div>
            <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="button" class="btn next-step">Dalej</button>
            </div>
          </div>

          <!-- STEP 5 -->
          <div data-step="5">
            <h3>Podsumowanie Twojej darowizny</h3>

            <div class="summary">
              <div class="form-section">
                <h4>Oddajesz:</h4>
                <ul>
                  <li>
                    <span class="icon icon-bag"></span>
                    <span class="summary--text" id="bagsToFill"></span>
                    <span class="summary--text" id="categoryToFill"></span>
                  </li>

                  <li>
                    <span class="icon icon-hand"></span>
                    <span class="summary--text" id="institutionToFill"></span>
                  </li>
                </ul>
              </div>

              <div class="form-section form-section--columns">
                <div class="form-section--column">
                  <h4>Adres odbioru:</h4>
                  <ul>
                    <li id="streetToFill"></li>
                    <li id="cityToFill"></li>
                    <li id="zipCodeToFill"></li>
                    <li id="phoneToFill"></li>
                  </ul>
                </div>

                <div class="form-section--column">
                  <h4>Termin odbioru:</h4>
                  <ul>
                    <li id="dateToFill"></li>
                    <li id="timeToFill"></li>
                    <li id="commentToFill"></li>
                  </ul>
                </div>
              </div>
            </div>

            <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="submit" class="btn">Potwierdzam</button>
            </div>
          </div>
        </form:form>
      </div>
    </section>

    <jsp:include page="footer.jsp"/>

    <script src="<c:url value="/resources/js/app.js"/>"></script>
  </body>
<script type="text/javascript">

  $(document).ready(function () {
      var bags = "";
      var category = "";
      var institution = "";
      var street = "";
      var city = "";
      var zipCode = "";
      var phone = "";
      var date = "";
      var time = "";
      var comment = "";

      $("#bags").change(function () {
          bags = $(this).val();
          $("#bagsToFill").html(bags  + " worki " + '</br>');
      })

      $("input[type='checkbox']").change(function () {
          category = $("input[name='categories']:checked").siblings(".description");
          var categories = new Array();
          category.each(function (index, element) {
              categories.push($(element).text());
              console.log(categories)
              return categories;
          })
          $("#categoryToFill").text(categories.join("; "));
      })
      
      $("input[type='radio']").change(function () {
          institution = $("input[name='institution.id']:checked").siblings().text();
          $("#institutionToFill").text(institution);
      })

      $("#street").change(function () {
          street = $(this).val();
          $("#streetToFill").text(street);
      })

      $("#city").change(function () {
          city = $(this).val();
          $("#cityToFill").text(city);
      })

      $("#zipCode").change(function () {
          zipCode = $(this).val();
          $("#zipCodeToFill").text(zipCode);
      })

      $("#phone").change(function () {
          phone = $(this).val();
          $("#phoneToFill").text(phone);
      })

      $("#date").change(function () {
          date = $(this).val();
          $("#dateToFill").text(date);
      })

      $("#time").change(function () {
          time = $(this).val();
          $("#timeToFill").text(time);
      })

      $("#comment").change(function () {
          comment = $(this).val();
          if(comment.length === 0){
              $("#commentToFill").text("Brak uwag")
          } else {
              $("#commentToFill").text(comment);
          }
      })
  })

</script>
</html>
