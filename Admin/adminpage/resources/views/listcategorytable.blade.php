

  
  @include('header')

<div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">Category list</h4>
                <a href="{{route('storecategory')}}">
                <p class="card-description"> Add class <code>.table-bordered</code>
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
                      @foreach($category as $category)
                      <tr>
                        <td>{{$category->id}}</td>
                        <td>{{$category->categoryname}}</td>
                        </tr>
                      @endforeach
                    </tbody>
                  </table>
 
                </div>

  
              </div>
 @include('footer')  
            </div>
</div>

      
     

   
