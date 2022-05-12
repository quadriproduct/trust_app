export default function Navbar(){
    return(
      //  <div className="navbar1">
      //      <div className="navbar4">
      //        <a className="navbar3" href="/about">Insurance</a>
      //        <a className="navbar3" href="/contact">Stream Earning</a>
      //        <a className="navbar3" href="/privacy-policy">Borrow</a>
      //       </div>

      //       <div className="navbar2">
      //        <a className="navbar3" href="/">Login</a>
      //        <a className="navbar3" href="/categories">Sign Up</a>
      //      </div >
      //    </div>

      <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
      <a class="navbar-brand" href="#">Trust</a>
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Insurance</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Stream Earning</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled">Borrow</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
      )
  }