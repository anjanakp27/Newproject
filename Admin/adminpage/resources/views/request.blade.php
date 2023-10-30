
 @include('header')
<div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">Request list</h4>
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
                      @php $SlNo = 1 @endphp
                      @foreach($requestadmin as $requestadmin)
                      <tr>
                        <td>{{ $SlNo }}</td>
                        <td>{{$requestadmin->shopname}}</td>
                        <td>{{$requestadmin->phonenumber}}</td>
                        <td>{{$requestadmin->category}}</td>
                        
                        <td><a href="{{ route('addrequest', $requestadmin) }}" class="btn btn-warning">Add</a>
 <form action="{{ route('deleterequest', $requestadmin) }}" method="POST" class="d-inline">@csrf
  @method('DELETE')
                      
                            <button type="submit" class="btn btn-danger">Delete</button>
</form>
                          </td>
                      </tr>
                       @php $SlNo++ @endphp
                      @endforeach
                    </tbody>
                  </table>
                </div>
              </div>
 @include('footer')  
            </div>
</div>

      
     

   

