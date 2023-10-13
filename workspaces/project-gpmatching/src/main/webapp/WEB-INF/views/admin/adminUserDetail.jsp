<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- Striped rows -->
            <div class="row mb-6">
              <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div id="striped-rows" class="mb-4">
                  <h2>Striped rows</h2>
                  <p>Use <code class="highlighter-rouge">.table-striped</code>
                    to add
                    zebra-striping to any table row within the <code
                      class="highlighter-rouge">&lt;tbody&gt;</code>.
                  </p>
                </div>
                <!-- Card -->
                <div class="card">
                  <ul class="nav nav-line-bottom"
                    id="pills-tab-striped-rows" role="tablist">
                    <li class="nav-item">
                      <a class="nav-link active"
                        id="pills-striped-rows-design-tab"
                        data-bs-toggle="pill"
                        href="#pills-striped-rows-design" role="tab"
                        aria-controls="pills-striped-rows-design"
                        aria-selected="true">회원 목록</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" id="pills-striped-rows-html-tab"
                        data-bs-toggle="pill"
                        href="#pills-striped-rows-html" role="tab"
                        aria-controls="pills-striped-rows-html"
                        aria-selected="false">HTML</a>
                    </li>
                  </ul>
                  <!-- Tab content -->
                  <div class="tab-content p-4"
                    id="pills-tabContent-striped-rows">
                    <div class="tab-pane tab-example-design fade show
                      active" id="pills-striped-rows-design"
                      role="tabpanel"
                      aria-labelledby="pills-striped-rows-design-tab">
                      <div class="table-responsive">
                      <table class="table table-striped">
                        <thead >
                          <tr>
                            <th scope="col">#</th>
                            <th scope="col">First</th>
                            <th scope="col">Last</th>
                            <th scope="col">Handle</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                          </tr>
                          <tr>
                            <th scope="row">2</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>@fat</td>
                          </tr>
                          <tr>
                            <th scope="row">3</th>
                            <td>Larry</td>
                            <td>the Bird</td>
                            <td>@twitter</td>
                          </tr>
                        </tbody>
                      </table>
                      </div>
                    </div>
                    <div class="tab-pane tab-example-html fade"
                      id="pills-striped-rows-html" role="tabpanel"
                      aria-labelledby="pills-striped-rows-html-tab">
                      <div class="copy-content copy-content-height">
                        <div class="code-toolbar"></div>
                          <pre><code class="language-markup"><span class="token tag"></span>
</body>
</html>