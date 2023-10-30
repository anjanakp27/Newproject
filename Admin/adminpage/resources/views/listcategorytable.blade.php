

  
  @include('header')

<div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">Category list</h4>
                <a href="{{route('storecategory')}}">
                <p class="card-description"> Admin<code>.table-bordered</code>
                </p>

                <div class="table-responsive">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>No.</th>
                        <th>Category name</th>
                     
                      </tr>
                    </thead>
                    <tbody>
                      @php $SlNo = 1 @endphp
                      @foreach($category as $category)
                      <tr>
                        <td>{{ $SlNo }}</td>
                        <td>{{$category->categoryname}}</td>
                        <td><a href="{{ route('editcategory', $category) }}" class="btn btn-warning">Edit</a>
 <form action="{{ route('destroycategory', $category) }}" method="POST" class="d-inline">@csrf
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

      
     

   

