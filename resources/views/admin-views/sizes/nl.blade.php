@extends('layouts.admin.app')

@section('title','Add new Nl')

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-add-circle-outlined"></i> {{__('messages.add')}} NL </h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <div class="card">
                    <div class="card-body">
                        <form action="{{route('admin.nl.store')}}" method="post">
                            @csrf
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlInput1">NL</label>
                                        <input type="text" name="nl" class="form-control" placeholder="NL" required>
                                    </div>
                                </div>
                                
                                
                                
                               
                            </div>

                            
                            <button type="submit" class="btn btn-primary">{{__('messages.submit')}}</button>
                        </form>
                    </div>
                </div>
                
            </div>

            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <div class="card">
                    <div class="card-header">
                    <h5>NL {{__('messages.list')}}<span class="badge badge-soft-dark ml-2" id="itemCount">{{$nls->count()}}</span></h5>
                        <!--<form id="dataSearch">-->
                        <!--@csrf-->
                            <!-- Search -->
                        <!--    <div class="input-group input-group-merge input-group-flush">-->
                        <!--        <div class="input-group-prepend">-->
                        <!--            <div class="input-group-text">-->
                        <!--                <i class="tio-search"></i>-->
                        <!--            </div>-->
                        <!--        </div>-->
                        <!--        <input id="datatableSearch" type="search" name="search" class="form-control" placeholder="{{__('messages.search_here')}}" aria-label="{{__('messages.search_here')}}">-->
                        <!--        <button type="submit" class="btn btn-light">{{__('messages.search')}}</button>-->
                        <!--    </div>-->
                            <!-- End Search -->
                        <!--</form>-->
                    </div>
                    <!-- Table -->
                    <div class="table-responsive datatable-custom" id="table-div">
                        <table class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table">
                            <thead class="thead-light">
                            <tr>
                                <th>{{__('messages.#')}}</th>
                                <th>NL</th>

                                <th>{{__('messages.action')}}</th>
                            </tr>
                            </thead>

                            <tbody id="set-rows">
                            @foreach($nls as $nl)
                                <tr>
                                    
                                    <td>{{$nl['id']}}</td>
                                    <td>{{$nl['nl']}}</td>

                                    
                                    <td>
                                        <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#exampleModal{{ $nl['id'] }}"><i class="tio-edit"></i>
                                        </button>
                                        
                                        
                                        <a class="btn btn-sm btn-white" href="{{ route('admin.nl.delete',[$nl['id']]) }}" title="{{__('messages.delete')}} NL"><i class="tio-delete-outlined"></i>
                                        </a>
                                        
                                        <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal{{ $nl['id'] }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form action="{{ route('admin.nl.update',[$nl['id']]) }}" method="post">
          <div class="modal-body">
                @csrf
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="input-label" for="exampleFormControlInput1">NL</label>
                            <input type="text" name="nl" class="form-control" placeholder="NL" value="{{$nl['nl']}}">
                        </div>
                    </div>
                    
                   
                    
                   
                </div>
    
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">{{__('messages.save')}}</button>
              </div>
          </div>
        </form>
      
    </div>
  </div>
</div>


                                        
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                        <hr>
                        
                    </div>
                </div>
            </div>
            <!-- End Table -->
        </div>
    </div>

@endsection
