<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Breeze Admin</title>
    
    <link rel="stylesheet" href="{{asset('css/materialdesignicons.min.css')}}" />
   
    <link rel="stylesheet" href="{{asset('css/flag-icon.min.css')}}" />
    
   <link rel="stylesheet" href="{{asset('css/vendor.bundle.base.css')}}" /><link rel="stylesheet" href="{{asset('css/fontawesome.css')}}" />
    <link rel="stylesheet" href="{{asset('css/datepicker.css')}}" />
    <link rel="stylesheet" href="{{asset('css/app.css')}}" />
    <link rel="stylesheet" href="{{ asset('css/style.css') }}" />

<link rel="stylesheet" href="{{ asset('css/style.css') }}">

    <link rel="shortcut icon" href="assets/images/favicon.png" />
   
  </head>
  <body>
    <div class="container-scroller">
     <nav class="sidebar sidebar-offcanvas" id="sidebar">
        
        <ul class="nav">
          <li class="nav-item nav-profile">
            <a href="#" class="nav-link">
             
              <div class="nav-profile-text d-flex flex-column pr-3">
                <span class="font-weight-medium mb-2">Admin</span>
               
              </div>
              
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="welcome">
              <i class="mdi mdi-home menu-icon"></i>
              <span class="menu-title">Dashboard</span>
            </a>
          </li>
          <li class="nav-item">

     <a class="nav-link" href="{{ route('listcategory') }}">
              <i class="mdi mdi-home menu-icon"></i>
              <span class="menu-title">Add Category</span>
            </a>
          </li>
          <li class="nav-item">

     <a class="nav-link" href="{{ route('addshop') }}">
              <i class="mdi mdi-home menu-icon"></i>
              <span class="menu-title">Add Shop</span>
            </a>
          </li>
        <li class="nav-item">
            <a class="nav-link" href="{{ route('viewshop') }}">
              <i class="mdi mdi-contacts menu-icon"></i>
              <span class="menu-title">View Shop</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{ route('viewcategory') }}">
              <i class="mdi mdi-format-list-bulleted menu-icon"></i>
              <span class="menu-title">List Category</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{ route('requestview') }}">
              <i class="mdi mdi-format-list-bulleted menu-icon"></i>
              <span class="menu-title">Request</span>
            </a>
          </li>
          
          
          
            <div class="nav-link">
              <div class="mt-4">
                
                <li class="nav-item sidebar-actions">
            <a class="nav-link" href="{{ route('signout') }}">
                <ul class="mt-4 pl-0">

                  <li>Sign Out</li>
                   </a>
                </ul>
              </div>
            </div>
          
        </ul>
      </nav>
      <div class="container-fluid page-body-wrapper">
        <div id="theme-settings" class="settings-panel">
          <i class="settings-close mdi mdi-close"></i>
          <p class="settings-heading">SIDEBAR SKINS</p>
          <div class="sidebar-bg-options selected" id="sidebar-default-theme">
            <div class="img-ss rounded-circle bg-light border mr-3"></div> Default
          </div>
          <div class="sidebar-bg-options" id="sidebar-dark-theme">
            <div class="img-ss rounded-circle bg-dark border mr-3"></div> Dark
          </div>
          <p class="settings-heading mt-2">HEADER SKINS</p>
          <div class="color-tiles mx-0 px-4">
            <div class="tiles light"></div>
            <div class="tiles dark"></div>
          </div>
        </div>
        <nav class="navbar col-lg-12 col-12 p-lg-0 fixed-top d-flex flex-row">
          <div class="navbar-menu-wrapper d-flex align-items-stretch justify-content-between">
          
            <ul class="navbar-nav navbar-nav-right ml-lg-auto">
              
              <li class="nav-item nav-profile dropdown border-0">
               
                <div class="dropdown-menu navbar-dropdown w-100" aria-labelledby="profileDropdown">
                  <a class="dropdown-item" href="#">
                    <i class="mdi mdi-cached mr-2 text-success"></i> Activity Log </a>
                  <a class="dropdown-item" href="#">
                    <i class="mdi mdi-logout mr-2 text-primary"></i> Signout </a>
                </div>
              </li>
            </ul>
             <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
              <span class="mdi mdi-menu"></span>
            </button> 
          </div>
        </nav>
        <div class="main-panel">
         
           @section('content')  
          
                          
         
      </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
   
   <script src="{{asset('js/vendor.bundle.base.js')}}"></script>
  
  
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="{{asset('js/chart.js')}}"></script>
    <script src="{{asset('js/datepicker.js')}}"></script>
    <script src="{{asset('js/flot.js')}}"></script>
    <script src="{{asset('js/resize.js')}}"></script>
    <script src="{{asset('js/categories.js')}}"></script>
    <script src="{{asset('js/fillbetween.js')}}"></script>
    <script src="{{asset('js/stack.js')}}"></script>
    <script src="{{asset('js/pie.js')}}"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="{{asset('js/offcanvas.js')}}"></script>
    <script src="{{asset('js/hoverable.js')}}"></script>
    <script src="{{asset('js/misc.js')}}"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="{{asset('js/dashboard.js')}}"></script>

  </body>

</html>
@endsection