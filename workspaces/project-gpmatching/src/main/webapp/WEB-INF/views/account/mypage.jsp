<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">



<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon/favicon.ico">

<!-- Libs CSS -->


<link href="../assets/libs/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="../assets/libs/dropzone/dist/dropzone.css"  rel="stylesheet">
<link href="../assets/libs/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet" />
<link href="../assets/libs/prismjs/themes/prism-okaidia.css" rel="stylesheet">








<!-- Theme CSS -->
<link rel="stylesheet" href="../assets/css/theme.min.css">
  <title>Profile Overview | Dash Ui - Bootstrap 5 Admin Dashboard Template</title>
</head>

<body class="bg-light"> 
  <div id="db-wrapper">
    <!-- navbar vertical -->
     <!-- Sidebar -->
 <nav class="navbar-vertical navbar">
    <div class="nav-scroller">
        <!-- Brand logo -->
        <a class="navbar-brand" href="../index.html">
            <img src="../assets/images/brand/logo/logo.svg" alt="" />
        </a>
        <!-- Navbar nav -->
        <ul class="navbar-nav flex-column" id="sideNavbar">
            <li class="nav-item">
                <a class="nav-link has-arrow " href="../index.html">
                    <i data-feather="home" class="nav-icon icon-xs me-2"></i>  Dashboard
                </a>

            </li>


         <!-- Nav item -->
         <li class="nav-item">
            <div class="navbar-heading">Layouts & Pages</div>
        </li>


             <!-- Nav item -->
             <li class="nav-item">
                <a class="nav-link has-arrow " href="#!" data-bs-toggle="collapse" data-bs-target="#navPages" aria-expanded="false" aria-controls="navPages">
                    <i
                    data-feather="layers"

                    class="nav-icon icon-xs me-2">
                </i> Pages
                </a>

                <div id="navPages" class="collapse  show " data-bs-parent="#sideNavbar">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link  active " href="../pages/profile.html">
                                Profile
                </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link has-arrow   "  href="../pages/settings.html" >
                                Settings
                                </a>

                        </li>


                        <li class="nav-item">
                            <a class="nav-link " href="../pages/billing.html">
                                Billing
                </a>
                        </li>




                        <li class="nav-item">
                            <a class="nav-link " href="../pages/pricing.html">
                               Pricing
                </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="../pages/404-error.html">
                                404 Error
                </a>
                        </li>
                    </ul>
                </div>

                </li>


                        <!-- Nav item -->
                        <li class="nav-item">
                            <a class="nav-link has-arrow  collapsed " href="#!" data-bs-toggle="collapse" data-bs-target="#navAuthentication" aria-expanded="false" aria-controls="navAuthentication">
                                <i data-feather="lock" class="nav-icon icon-xs me-2">
                                </i> Authentication
                            </a>
                            <div id="navAuthentication" class="collapse " data-bs-parent="#sideNavbar">
                                <ul class="nav flex-column">
                                    <li class="nav-item">
                                        <a class="nav-link " href="../pages/sign-in.html"> Sign In</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link  " href="../pages/sign-up.html"> Sign Up</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link " href="../pages/forget-password.html">
                                             Forget Password
                                </a>
                                    </li>

                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="../pages/layout.html">
                                <i
                                    data-feather="sidebar"

                                    class="nav-icon icon-xs me-2"
                                >
                                </i
                                      >
                                Layouts
                            </a>
                        </li>

                        <!-- Nav item -->
                        <li class="nav-item">
                            <div class="navbar-heading">UI Components</div>
                        </li>

                        <!-- Nav item -->
                        <li class="nav-item">
                            <a class="nav-link has-arrow " href="../docs/accordions.html" >
                                <i data-feather="package" class="nav-icon icon-xs me-2" >
                            </i>  Components
                            </a>
                         </li>
                  

                        <li class="nav-item">
                            <a class="nav-link has-arrow  collapsed " href="#!" data-bs-toggle="collapse" data-bs-target="#navMenuLevel" aria-expanded="false" aria-controls="navMenuLevel">
                                <i
                                data-feather="corner-left-down"

                                class="nav-icon icon-xs me-2"
                            >
                            </i
                                      > Menu Level
                            </a>
                            <div id="navMenuLevel" class="collapse " data-bs-parent="#sideNavbar">
                                <ul class="nav flex-column">
                                    <li class="nav-item">
                                        <a class="nav-link has-arrow " href="#!" data-bs-toggle="collapse" data-bs-target="#navMenuLevelSecond" aria-expanded="false" aria-controls="navMenuLevelSecond">
                                    Two Level
                                </a>
                                        <div id="navMenuLevelSecond" class="collapse" data-bs-parent="#navMenuLevel">
                                            <ul class="nav flex-column">
                                                <li class="nav-item">
                                                    <a class="nav-link " href="#!">  NavItem 1</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link " href="#!">  NavItem 2</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link has-arrow  collapsed  " href="#!" data-bs-toggle="collapse" data-bs-target="#navMenuLevelThree" aria-expanded="false" aria-controls="navMenuLevelThree">
                                    Three Level
                                </a>
                                        <div id="navMenuLevelThree" class="collapse " data-bs-parent="#navMenuLevel">
                                            <ul class="nav flex-column">
                                                <li class="nav-item">
                                                    <a class="nav-link  collapsed " href="#!" data-bs-toggle="collapse" data-bs-target="#navMenuLevelThreeOne" aria-expanded="false" aria-controls="navMenuLevelThreeOne">
                                                         NavItem 1
                                            </a>
                                                    <div id="navMenuLevelThreeOne" class="collapse collapse " data-bs-parent="#navMenuLevelThree">
                                                        <ul class="nav flex-column">
                                                            <li class="nav-item">
                                                                <a class="nav-link " href="#!">
                                                                     NavChild Item 1
                                                        </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link " href="#!">  Nav Item 2</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </li>

                                         <!-- Nav item -->
                        <li class="nav-item">
                            <div class="navbar-heading">Documentation</div>
                        </li>

                        <!-- Nav item -->
                        <li class="nav-item">
                            <a class="nav-link has-arrow " href="../docs/index.html" >
                                <i data-feather="clipboard" class="nav-icon icon-xs me-2" >
                            </i>  Docs
                            </a>
                         </li>
                         <li class="nav-item">
                            <a class="nav-link has-arrow " href="../docs/changelog.html" >
                                <i data-feather="git-pull-request" class="nav-icon icon-xs me-2" >
                            </i>  Changelog
                            </a>
                         </li>




                    </ul>

                </div>
</nav>
    <!-- page content -->
    <div id="page-content">
      <div class="header @@classList">
  <!-- navbar -->
  <nav class="navbar-classic navbar navbar-expand-lg">
    <a id="nav-toggle" href="#"><i
        data-feather="menu"

        class="nav-icon me-2 icon-xs"></i></a>
    <div class="ms-lg-3 d-none d-md-none d-lg-block">
      <!-- Form -->
      <form class="d-flex align-items-center">
        <input type="search" class="form-control" placeholder="Search" />
      </form>
    </div>
    <!--Navbar nav -->
    <ul class="navbar-nav navbar-right-wrap ms-auto d-flex nav-top-wrap">
      <li class="dropdown stopevent">
        <a class="btn btn-light btn-icon rounded-circle indicator
          indicator-primary text-muted" href="#" role="button"
          id="dropdownNotification" data-bs-toggle="dropdown" aria-haspopup="true"
          aria-expanded="false">
          <i class="icon-xs" data-feather="bell"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end"
          aria-labelledby="dropdownNotification">
          <div>
            <div class="border-bottom px-3 pt-2 pb-3 d-flex
              justify-content-between align-items-center">
              <p class="mb-0 text-dark fw-medium fs-4">Notifications</p>
              <a href="#" class="text-muted">
                <span>
                  <i class="me-1 icon-xxs" data-feather="settings"></i>
                </span>
              </a>
            </div>
            <!-- List group -->
            <ul class="list-group list-group-flush notification-list-scroll">
              <!-- List group item -->
              <li class="list-group-item bg-light">


                <a href="#" class="text-muted">
                    <h5 class=" mb-1">Rishi Chopra</h5>
                    <p class="mb-0">
                      Mauris blandit erat id nunc blandit, ac eleifend dolor pretium.
                    </p>
                </a>



          </li>
             <!-- List group item -->
             <li class="list-group-item">


              <a href="#" class="text-muted">
                  <h5 class=" mb-1">Neha Kannned</h5>
                  <p class="mb-0">
                    Proin at elit vel est condimentum elementum id in ante. Maecenas et sapien metus.
                  </p>
              </a>



        </li>
              <!-- List group item -->
              <li class="list-group-item">


                <a href="#" class="text-muted">
                    <h5 class=" mb-1">Nirmala Chauhan</h5>
                    <p class="mb-0">
                      Morbi maximus urna lobortis elit sollicitudin sollicitudieget elit vel pretium.
                    </p>
                </a>



          </li>
              <!-- List group item -->
              <li class="list-group-item">


                    <a href="#" class="text-muted">
                        <h5 class=" mb-1">Sina Ray</h5>
                        <p class="mb-0">
                          Sed aliquam augue sit amet mauris volutpat hendrerit sed nunc eu diam.
                        </p>
                    </a>



              </li>
            </ul>
            <div class="border-top px-3 py-2 text-center">
              <a href="#" class="text-inherit fw-semi-bold">
                View all Notifications
              </a>
            </div>
          </div>
        </div>
      </li>
      <!-- List -->
      <li class="dropdown ms-2">
        <a class="rounded-circle" href="#" role="button" id="dropdownUser"
          data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <div class="avatar avatar-md avatar-indicators avatar-online">
            <img alt="avatar" src="../assets/images/avatar/avatar-1.jpg"
              class="rounded-circle" />
          </div>
        </a>
        <div class="dropdown-menu dropdown-menu-end"
          aria-labelledby="dropdownUser">
          <div class="px-4 pb-0 pt-2">


            <div class="lh-1 ">
              <h5 class="mb-1"> John E. Grainger</h5>
              <a href="#" class="text-inherit fs-6">View my profile</a>
            </div>
            <div class=" dropdown-divider mt-3 mb-2"></div>
          </div>

          <ul class="list-unstyled">

            <li>
              <a class="dropdown-item" href="#">
                <i class="me-2 icon-xxs dropdown-item-icon" data-feather="user"></i>Edit
                Profile
              </a>
            </li>
            <li>
              <a class="dropdown-item"
                href="#">
                <i class="me-2 icon-xxs dropdown-item-icon"
                  data-feather="activity"></i>Activity Log
              </a>


            </li>

            <li>
              <a class="dropdown-item text-primary" href="#">
                <i class="me-2 icon-xxs text-primary dropdown-item-icon"
                  data-feather="star"></i>Go Pro
              </a>
            </li>
            <li>
              <a class="dropdown-item" href="#">
                <i class="me-2 icon-xxs dropdown-item-icon"
                  data-feather="settings"></i>Account Settings
              </a>
            </li>
            <li>
              <a class="dropdown-item" href="../index.html">
                <i class="me-2 icon-xxs dropdown-item-icon"
                  data-feather="power"></i>Sign Out
              </a>
            </li>
          </ul>

        </div>
      </li>
    </ul>
  </nav>
</div>
      <!-- Container fluid -->
      <div class="container-fluid p-6">
        <div class="row">
          <div class="col-lg-12 col-md-12 col-12">
            <!-- Page header -->
           
              <div class="border-bottom pb-4 mb-4 ">
               
                  <h3 class="mb-0 fw-bold">Overview</h3>
              
           
            </div>
          </div>
        </div>
        <div class="row align-items-center">
          <div class="col-xl-12 col-lg-12 col-md-12 col-12">
            <!-- Bg -->
            <div class="pt-20 rounded-top" style="background:
                url(../assets/images/background/profile-cover.jpg) no-repeat;
                background-size: cover;">
            </div>
            <div class="bg-white rounded-bottom smooth-shadow-sm ">
              <div class="d-flex align-items-center justify-content-between
                  pt-4 pb-6 px-4">
                <div class="d-flex align-items-center">
                  <!-- avatar -->
                  <div class="avatar-xxl avatar-indicators avatar-online me-2
                      position-relative d-flex justify-content-end
                      align-items-end mt-n10">
                    <img src="../assets/images/avatar/avatar-1.jpg" class="avatar-xxl
                        rounded-circle border border-4 border-white-color-40" alt="">
                    <a href="#!" class="position-absolute top-0 right-0 me-2" data-bs-toggle="tooltip" data-placement="top" title="" data-original-title="Verified">
                      <img src="../assets/images/svg/checked-mark.svg" alt="" height="30" width="30">
                    </a>
                  </div>
                  <!-- text -->
                  <div class="lh-1">
                    <h2 class="mb-0">Jitu Chauhan
                      <a href="#!" class="text-decoration-none" data-bs-toggle="tooltip" data-placement="top" title="" data-original-title="Beginner">

                      </a>
                    </h2>
                    <p class="mb-0 d-block">@imjituchauhan</p>
                  </div>
                </div>
                <div>
                  <a href="#" class="btn btn-outline-primary
                      d-none d-md-block">Edit Profile</a>
                </div>
              </div>
              <!-- nav -->
              <ul class="nav nav-lt-tab px-4" id="pills-tab" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" href="#">Overview</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Project</a>
                </li>

                <li class="nav-item">
                  <a class="nav-link" href="#">Files</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Teams</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">
                      Followers
                    </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Activity</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <!-- content -->
        <div class="py-6">
          <!-- row -->
          <div class="row">
            <div class="col-xl-6 col-lg-12 col-md-12 col-12 mb-6">
              <!-- card -->
              <div class="card">
                <!-- card body -->
                <div class="card-body">
                  <!-- card title -->
                  <h4 class="card-title">About Me</h4>
                  <span class="text-uppercase fw-medium text-dark
                      fs-5 ls-2">Bio</span>
                  <!-- text -->
                  <p class="mt-2 mb-6">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspen disse var ius enim in eros elementum tristique. Duis cursus, mi quis viverra ornare, eros dolor interdum nulla, ut commodo diam libero vitae erat.
                  </p>
                  <!-- row -->
                  <div class="row">
                    <div class="col-12 mb-5">
                      <!-- text -->
                      <h6 class="text-uppercase fs-5 ls-2">Position
                      </h6>
                      <p class="mb-0">Theme designer at Bootstrap.</p>
                    </div>
                    <div class="col-6 mb-5">
                      <h6 class="text-uppercase fs-5 ls-2">Phone </h6>
                      <p class="mb-0">+32112345689</p>
                    </div>
                    <div class="col-6 mb-5">
                      <h6 class="text-uppercase fs-5 ls-2">Date of Birth </h6>
                      <p class="mb-0">01.10.1997</p>
                    </div>
                    <div class="col-6">
                      <h6 class="text-uppercase fs-5 ls-2">Email </h6>
                      <p class="mb-0">Dashui@gmail.com</p>
                    </div>
                    <div class="col-6">
                      <h6 class="text-uppercase fs-5 ls-2">Location
                      </h6>
                      <p class="mb-0">Ahmedabad, India</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-6 col-lg-12 col-md-12 col-12 mb-6">
              <!-- card -->
              <div class="card">
                <!-- card body -->
                <div class="card-body">
                  <!-- card title -->
                  <h4 class="card-title">Projects Contributions</h4>
                  <div class="d-md-flex justify-content-between
                      align-items-center mb-4">
                    <div class="d-flex align-items-center">
                      <div>
                        <div class="icon-shape icon-lg border p-4 rounded-1">
                          <img src="../assets/images/brand/slack-logo.svg" alt="">
                        </div>
                      </div>
                      <!-- text -->
                      <div class="ms-3 ">
                        <h5 class="mb-1"><a href="#" class="text-inherit">Slack Figma Design
                            UI</a></h5>
                        <p class="mb-0 fs-5 text-muted">Project description and details about...</p>
                      </div>
                    </div>
                    <div class="d-flex align-items-center ms-10 ms-md-0 mt-3">
                      <!-- avatar group -->
                      <div class="avatar-group me-2">
                        <!-- img -->
                        <span class="avatar avatar-sm">
                            <img alt="avatar"
                              src="../assets/images/avatar/avatar-1.jpg"
                              class="rounded-circle">
                          </span>
                        <!-- img -->
                        <span class="avatar avatar-sm">
                            <img alt="avatar"
                              src="../assets/images/avatar/avatar-2.jpg"
                              class="rounded-circle">
                          </span>
                        <!-- img -->
                        <span class="avatar avatar-sm">
                            <img alt="avatar"
                              src="../assets/images/avatar/avatar-3.jpg"
                              class="rounded-circle">
                          </span>
                      </div>
                      <div>
                        <!-- dropdown -->
                        <div class="dropdown dropstart">
                          <a href="#" class="text-muted text-primary-hover" id="dropdownprojectOne" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i data-feather="more-vertical" class="icon-xxs"></i>
                          </a>
                          <div class="dropdown-menu" aria-labelledby="dropdownprojectOne">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else
                                here</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="d-md-flex justify-content-between
                      align-items-center mb-4">
                    <div class="d-flex align-items-center">
                      <div>
                        <!-- icon shape -->
                        <div class="icon-shape icon-lg border p-4 rounded-1">
                          <img src="../assets/images/brand/3dsmax-logo.svg" alt="">
                        </div>
                      </div>
                      <!-- text -->
                      <div class="ms-3 ">
                        <h5 class="mb-1"><a href="#" class="text-inherit">Design 3d Character</a></h5>
                        <p class="mb-0 fs-5 text-muted">Project description and details about...</p>
                      </div>
                    </div>

                    <div class="d-flex align-items-center ms-10 ms-md-0 mt-3">
                      <!-- avatar group -->
                      <div class="avatar-group me-2">
                        <span class="avatar avatar-sm">
                             <!-- img -->
                            <img alt="avatar"
                              src="../assets/images/avatar/avatar-4.jpg"
                              class="rounded-circle">
                          </span>
                        <span class="avatar avatar-sm">
                             <!-- img -->
                            <img alt="avatar"
                              src="../assets/images/avatar/avatar-5.jpg"
                              class="rounded-circle">
                          </span>
                        <span class="avatar avatar-sm">
                             <!-- img -->
                            <img alt="avatar"
                              src="../assets/images/avatar/avatar-6.jpg"
                              class="rounded-circle">
                          </span>
                      </div>
                      <div>
                        <!-- dropdown -->
                        <div class="dropdown dropstart">
                          <a href="#" class="text-muted text-primary-hover" id="dropdownprojectTwo" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i data-feather="more-vertical" class="icon-xxs"></i>
                          </a>
                          <div class="dropdown-menu" aria-labelledby="dropdownprojectTwo">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else
                                here</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="d-md-flex justify-content-between
                      align-items-center mb-4">
                    <div class="d-flex align-items-center">
                      <div>
                        <!-- icon shape -->
                        <div class="icon-shape icon-lg border p-4 rounded-1">
                          <img src="../assets/images/brand/github-logo.svg" alt="">
                        </div>
                      </div>
                      <!-- text -->
                      <div class="ms-3 ">
                        <h5 class="mb-1"><a href="#" class="text-inherit">Github Development</a></h5>
                        <p class="mb-0 fs-5 text-muted">Project description and details about...</p>
                      </div>
                    </div>
                    <div class="d-flex align-items-center ms-10 ms-md-0 mt-3">
                      <!-- avatar group -->
                      <div class="avatar-group me-2">
                        <span class="avatar avatar-sm">
                             <!-- img -->
                            <img alt="avatar"
                              src="../assets/images/avatar/avatar-7.jpg"
                              class="rounded-circle">
                          </span>
                        <span class="avatar avatar-sm">
                             <!-- img -->
                            <img alt="avatar"
                              src="../assets/images/avatar/avatar-8.jpg"
                              class="rounded-circle">
                          </span>
                        <span class="avatar avatar-sm">
                             <!-- img -->
                            <img alt="avatar"
                              src="../assets/images/avatar/avatar-9.jpg"
                              class="rounded-circle">
                          </span>
                      </div>
                      <div>
                        <!-- dropdown -->
                        <div class="dropdown dropstart">
                          <a href="#" class="text-muted text-primary-hover" id="dropdownprojectThree" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i data-feather="more-vertical" class="icon-xxs"></i>
                          </a>
                          <div class="dropdown-menu" aria-labelledby="dropdownprojectThree">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else
                                here</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="d-md-flex justify-content-between
                      align-items-center mb-4">
                    <div class="d-flex align-items-center">
                      <!-- icon shape -->
                      <div>
                        <div class="icon-shape icon-lg border p-4 rounded-1">
                          <img src="../assets/images/brand/dropbox-logo.svg" alt="">
                        </div>
                      </div>
                      <!-- text -->
                      <div class="ms-3 ">
                        <h5 class="mb-1"><a href="#" class="text-inherit">Dropbox Design
                            System</a></h5>
                        <p class="mb-0 fs-5 text-muted">Project description and details about...</p>
                      </div>
                    </div>
                    <div class="d-flex align-items-center ms-10 ms-md-0 mt-3">
                      <!-- avatar group -->
                      <div class="avatar-group me-2">
                        <!-- img -->
                        <span class="avatar avatar-sm">
                            <img alt="avatar"
                              src="../assets/images/avatar/avatar-10.jpg"
                              class="rounded-circle">
                          </span>
                        <!-- img -->
                        <span class="avatar avatar-sm">
                            <img alt="avatar"
                              src="../assets/images/avatar/avatar-11.jpg"
                              class="rounded-circle">
                          </span>
                        <!-- img -->
                        <span class="avatar avatar-sm">
                            <img alt="avatar"
                              src="../assets/images/avatar/avatar-12.jpg"
                              class="rounded-circle">
                          </span>
                      </div>
                      <div>
                        <!-- dropdown -->
                        <div class="dropdown dropstart">
                          <a href="#" class="text-muted text-primary-hover" id="dropdownprojectFour" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i data-feather="more-vertical" class="icon-xxs"></i>
                          </a>
                          <div class="dropdown-menu" aria-labelledby="dropdownprojectFour">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else
                                here</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="d-md-flex justify-content-between
                      align-items-center">
                    <div class="d-flex align-items-center">
                      <!-- icon shape -->
                      <div>
                        <div class="icon-shape icon-lg border p-4 rounded-1
                            bg-primary">
                          <img src="../assets/images/brand/layers-logo.svg" alt="">
                        </div>
                      </div>
                      <!-- text -->
                      <div class="ms-3 ">
                        <h5 class="mb-1"><a href="#" class="text-inherit">Project Management</a></h5>
                        <p class="mb-0 fs-5 text-muted">Project description and details about...</p>
                      </div>
                    </div>
                    <div class="d-flex align-items-center ms-10 ms-md-0 mt-3">
                      <!-- avatar group -->
                      <div class="avatar-group me-2">
                        <!-- img -->
                        <span class="avatar avatar-sm">
                            <img alt="avatar"
                              src="../assets/images/avatar/avatar-13.jpg"
                              class="rounded-circle">
                          </span>
                        <!-- img -->
                        <span class="avatar avatar-sm">
                            <img alt="avatar"
                              src="../assets/images/avatar/avatar-14.jpg"
                              class="rounded-circle">
                          </span>
                        <!-- img -->
                        <span class="avatar avatar-sm">
                            <img alt="avatar"
                              src="../assets/images/avatar/avatar-15.jpg"
                              class="rounded-circle">
                          </span>
                      </div>
                      <div>
                        <!-- dropdown -->
                        <div class="dropdown dropstart">
                          <a href="#" class="text-muted text-primary-hover" id="dropdownprojectFoufive" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i data-feather="more-vertical" class="icon-xxs"></i>
                          </a>
                          <div class="dropdown-menu" aria-labelledby="dropdownprojectFoufive">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else
                                here</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-6 col-md-12 col-12 mb-6">
              <!-- card -->
              <div class="card">
                <!-- card body -->
                <div class="card-body">
                  <div class="d-flex justify-content-between mb-5
                      align-items-center">
                    <!-- avatar -->
                    <div class="d-flex align-items-center">
                      <div>
                        <img src="../assets/images/avatar/avatar-1.jpg" alt="" class="avatar avatar-md rounded-circle">
                      </div>
                      <div class="ms-3">
                        <h5 class="mb-0 fw-bold">Jitu Chauhan</h5>
                        <p class="mb-0">19 minutes ago</p>
                      </div>
                    </div>
                    <div>
                      <!-- dropdown -->
                      <div class="dropdown dropstart">
                        <a href="#" class="text-muted text-primary-hover" id="dropdownprojectFive" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <i data-feather="more-vertical" class="icon-xxs"></i>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="dropdownprojectFive">
                          <a class="dropdown-item" href="#">Action</a>
                          <a class="dropdown-item" href="#">Another action</a>
                          <a class="dropdown-item" href="#">Something else
                              here</a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="mb-4">
                    <!-- text -->
                    <p class="mb-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspen disse var ius enim in eros elementum tristique. Duis cursus, mi quis viverra ornare, eros dolor interdum nulla, ut commodo diam libero vitae erat.</p>
                    <img src="../assets/images/blog/blog-img-1.jpg" class="rounded-3 w-100" alt="">
                  </div>
                  <!-- icons -->
                  <div class="mb-4">
                    <span class="me-1 me-md-4"><i data-feather="heart"
                          class="icon-xxs text-muted me-2"></i><span>20 Like</span></span>
                    <span class="me-1 me-md-4"><i
                          data-feather="message-square" class="icon-xxs
                          text-muted me-2"></i><span>12 Comment</span></span>
                    <span><i data-feather="share-2" class="icon-xxs
                          text-muted me-2"></i><span>Share</span></span>
                  </div>
                  <div class="border-bottom border-top py-5 d-flex
                      align-items-center mb-4">
                    <!-- avatar group -->
                    <div class="avatar-group me-2 me-md-3">
                      <span class="avatar avatar-sm">
                            <!-- img -->
                          <img alt="avatar"
                            src="../assets/images/avatar/avatar-7.jpg"
                            class="rounded-circle">
                        </span>
                      <span class="avatar avatar-sm">
                             <!-- img -->
                          <img alt="avatar"
                            src="../assets/images/avatar/avatar-8.jpg"
                            class="rounded-circle">
                        </span>
                      <span class="avatar avatar-sm">
                             <!-- img -->
                          <img alt="avatar"
                            src="../assets/images/avatar/avatar-9.jpg"
                            class="rounded-circle">
                        </span>
                    </div>
                    <div><span>You and 20 more liked this</span></div>
                  </div>
                  <!-- row -->
                  <div class="row">
                    <div class="col-xl-1 col-lg-2 col-md-2 col-12 mb-3 mb-lg-0">
                      <!-- avatar -->
                      <img src="../assets/images/avatar/avatar-1.jpg" class="avatar avatar-md rounded-circle" alt="">
                    </div>
                    <!-- input -->
                    <div class="col-xl-11 col-lg-10 col-md-9 col-12 ">

                      <div class="row g-3 align-items-center">
                        <div class="col-md-2 col-xxl-1">
                          <label for="name" class="col-form-label ">Name</label>
                        </div>
                        <div class="col-md-8 col-xxl-9  mt-0 mt-md-3">
                          <input type="password" id="name" class="form-control" aria-describedby="name">
                        </div>
                        <div class="col-md-2 col-xxl-2">
                          <button type="submit" class="btn btn-primary">Post</button>
                        </div>
                      </div>

                    </div>

                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-6 col-lg-12 col-md-12 col-12 mb-6">
              <!-- card -->
              <div class="card mb-4">
                <!-- card body -->
                <div class="card-body">
                  <!-- card title -->
                  <h4 class="card-title">My Team</h4>
                  <div class="d-flex justify-content-between
                      align-items-center mb-4">
                    <div class="d-flex align-items-center">
                      <!-- img -->
                      <div>
                        <img src="../assets/images/avatar/avatar-1.jpg" class="rounded-circle avatar-md" alt="">
                      </div>
                      <!-- text -->
                      <div class="ms-3 ">
                        <h5 class="mb-1">Dianna Smiley</h5>
                        <p class="text-muted mb-0 fs-5 text-muted">UI / UX Designer
                        </p>
                      </div>
                    </div>
                    <div>
                      <a href="#" class="text-muted text-primary-hover"><i
                            class="me-4 icon-xs" data-feather="phone-call"></i></a>
                      <a href="#" class="text-muted text-primary-hover"><i
                            class="icon-xs" data-feather="video"></i></a>
                    </div>
                  </div>
                  <div class="d-flex justify-content-between
                      align-items-center mb-4">
                    <div class="d-flex align-items-center">
                      <!-- img -->
                      <div>
                        <img src="../assets/images/avatar/avatar-2.jpg" class="rounded-circle avatar-md" alt="">
                      </div>
                      <!-- content -->
                      <div class="ms-3 ">
                        <h5 class="mb-1">Anne Brewer</h5>
                        <p class="text-muted mb-0 fs-5 text-muted">Senior UX Designer
                        </p>
                      </div>
                    </div>
                    <div>
                      <!-- icons -->
                      <a href="#" class="text-muted text-primary-hover"><i
                            class="me-4 icon-xs" data-feather="phone-call"></i></a>
                      <a href="#" class="text-muted text-primary-hover"><i
                            class="icon-xs" data-feather="video"></i></a>
                    </div>
                  </div>
                  <div class="d-flex justify-content-between
                      align-items-center mb-4">
                    <div class="d-flex align-items-center">
                      <!-- img -->
                      <div>
                        <img src="../assets/images/avatar/avatar-3.jpg" class="rounded-circle avatar-md" alt="">
                      </div>
                      <!-- text -->
                      <div class="ms-3 ">
                        <h5 class="mb-1">Richard Christmas
                        </h5>
                        <p class="text-muted mb-0 ">Front-End Engineer</p>
                      </div>
                    </div>
                    <div>
                      <!-- icons -->
                      <a href="#" class="text-muted text-primary-hover"><i
                            class="me-4 icon-xs" data-feather="phone-call"></i></a>
                      <a href="#" class="text-muted text-primary-hover"><i
                            class="icon-xs" data-feather="video"></i></a>
                    </div>
                  </div>
                  <div class="d-flex justify-content-between
                      align-items-center">
                    <!-- img -->
                    <div class="d-flex align-items-center">
                      <div>
                        <img src="../assets/images/avatar/avatar-4.jpg" class="rounded-circle avatar-md" alt="">
                      </div>
                      <!-- text -->
                      <div class="ms-3 ">
                        <h5 class="mb-1">Nicholas Binder
                        </h5>
                        <p class="text-muted mb-0 fs-5 ">Content Marketing Manager</p>
                      </div>
                    </div>
                    <div>
                      <a href="#" class="text-muted text-primary-hover"><i
                            class="me-4 icon-xs" data-feather="phone-call"></i></a>
                      <a href="#" class="text-muted text-primary-hover"><i
                            class="icon-xs" data-feather="video"></i></a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-12">
                  <!-- card -->
                  <div class="card">
                    <!-- card body -->
                    <div class="card-body">
                      <!-- card title -->
                      <h4 class="card-title">Activity Feed</h4>

                      <div class="d-flex mb-5">
                        <!-- img -->
                        <div>
                          <img src="../assets/images/avatar/avatar-6.jpg" class="rounded-circle avatar-md" alt="">
                        </div>
                        <!-- content -->
                        <div class="ms-3 ">
                          <h5 class="mb-1">Dianna Smiley</h5>
                          <p class="text-muted mb-2">Just create a new Project in Dashui...
                          </p>
                          <p class="fs-5 mb-0">2m ago</p>
                        </div>
                      </div>
                      <div class="d-flex mb-5">
                        <!-- img -->
                        <div>
                          <img src="../assets/images/avatar/avatar-7.jpg" class="rounded-circle avatar-md" alt="">
                        </div>
                        <!-- content -->
                        <div class="ms-3 ">
                          <h5 class="mb-1">Irene Hargrove</h5>
                          <p class="text-muted mb-2">Comment on Bootstrap Tutorial Says Hi, I m irene...
                          </p>
                          <p class="fs-5 mb-0">1hour ago</p>
                        </div>
                      </div>
                      <div class="d-flex">
                        <!-- img -->
                        <div>
                          <img src="../assets/images/avatar/avatar-9.jpg" class="rounded-circle avatar-md" alt="">
                        </div>
                        <!-- content -->
                        <div class="ms-3 ">
                          <h5 class="mb-1">Trevor Bradley</h5>
                          <p class="text-muted mb-2">Just share your article on Social Media..
                          </p>
                          <p class="mb-0 fs-5 text-muted">2month ago</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Scripts -->
  <!-- Libs JS -->
<script src="../assets/libs/jquery/dist/jquery.min.js"></script>
<script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="../assets/libs/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="../assets/libs/feather-icons/dist/feather.min.js"></script>
<script src="../assets/libs/prismjs/prism.js"></script>
<script src="../assets/libs/apexcharts/dist/apexcharts.min.js"></script>
<script src="../assets/libs/dropzone/dist/min/dropzone.min.js"></script>
<script src="../assets/libs/prismjs/plugins/toolbar/prism-toolbar.min.js"></script>
<script src="../assets/libs/prismjs/plugins/copy-to-clipboard/prism-copy-to-clipboard.min.js"></script>




<!-- Theme JS -->
<script src="../assets/js/theme.min.js"></script>
</body>

</html>