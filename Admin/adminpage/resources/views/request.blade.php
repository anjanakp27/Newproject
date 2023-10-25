
 @include('header')
<div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">Shops list</h4>
                <p class="card-description">Admin <code>.table-bordered</code>
                </p>

                <div class="table-responsive">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>No.</th>
                        <th>Shop name</th>
                        <th>Phone number</th>
                        <th>Category</th>
                        
                      </tr>
                    </thead>
                    <tbody>
                      @foreach($shops as $shops)
                      <tr>
                        <td>{{$shops->id}}</td>
                        <td>{{$shops->shopname}}</td>
                        <td>{{$shops->phonenumber}}</td>
                        <td>{{$shops->category}}</td>
                        
                        <td><a href="{{ route('add', $shops) }}" class="btn btn-warning">Add</a>
 <form action="{{ route('destroy', $shops) }}" method="POST" class="d-inline">@csrf
  @method('DELETE')
                      
                            <button type="submit" class="btn btn-danger">Delete</button>
</form>
                          </td>
                      </tr>
                      @endforeach
                    </tbody>
                  </table>
                </div>
              </div>
 @include('footer')  
            </div>
</div>

      
     

   

