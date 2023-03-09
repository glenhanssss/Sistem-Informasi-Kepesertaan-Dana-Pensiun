<nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="index.php?page=dashboard" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                Dashboard
                <span class="right badge badge-danger">New</span>
              </p>
            </a>
          </li>
          <li class="nav-item menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                KEPESERTAAN DPSW
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="index.php?page=data-peserta" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>PESERTA</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="index.php?page=data-phdp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>PHDP</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="index.php?page=data-iuran" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>IURAN</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="index.php?page=data-iuran-per-peserta" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>MANFAAT</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="logout.php" class="nav-link text-red">
              <i class="nav-icon fas fa-power-off"></i>
              <p>
                Logout
              </p>
            </a>
          </li>
        </ul>
</nav>