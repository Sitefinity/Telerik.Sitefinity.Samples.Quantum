<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StoreLocator.ascx.cs" Inherits="SitefinityWebApp.MyControls.StoreLocator" %>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false">
</script>
<script src="http://www.google.com/jsapi"></script> 
<script type="text/javascript" src="http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerclusterer/src/markerclusterer.js"></script>

<script type="text/javascript">
    
    var geocoder;
    var markers = [];
    var map;

    function initialize() {
        geocoder = new google.maps.Geocoder();
        var latlng = new google.maps.LatLng(32.72722,-117.0718);
        var myOptions = {
            zoom: 8,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP


        }
        map = new google.maps.Map(document.getElementById("map_canvas_all_stores"), myOptions);

        GetMapAdress ();

        setTimeout(createCluster, 2000);


    }

    function createCluster() 
    {
        var markerCluster = new MarkerClusterer(map, markers);
    }

    var infowindow = new google.maps.InfoWindow();   

    function showAddress(storename, lat, lng, comment, orderletter) {                                       
                                               
                    var image = 'http://www.google.com/mapfiles/marker'+orderletter+'.png';     
                    
                    var myLatLng = new google.maps.LatLng(lat, lng);
                    map.setCenter(myLatLng);
                    var marker = new google.maps.Marker({
                        map: map,
                        position: myLatLng,
                        icon: image,
                        title: storename,
                        animation: google.maps.Animation.DROP                        
                    });                  
                    markers.push(marker);

                    google.maps.event.addListener(marker, 'click', function () {
                        infowindow.setContent(comment);
                        infowindow.open(map, marker);
                    });
                    
    }

    function myclick(i, elem) {
        google.maps.event.trigger(markers[i], 'click');      
    };

    function myhover(i) {      
        markers[i].setAnimation(google.maps.Animation.BOUNCE);
    }

    function mymouseout(i) {
        markers[i].setAnimation(null);
    }

    function changeBckgr(elem)
    {
        $('.sfstoreitem').removeClass('active');
        $(elem).addClass('active');
    }

    function GetMapAdress(address) {        
      <%# showAddress %>        
    }   

  </script>


<script type="text/javascript">
    $(document).ready(function () { initialize(); return true; });

    //    $('li.sfstoreitem').click(function () {
    // $(this).toggleClass('active');
    //  });
</script>

<div id="store-locator-wrapper">
   

    <div id="stores-list">        
         <asp:TextBox ID="tbZip" AutoPostBack="true" class="zip-box" 
            OnClick="this.value='';" Text="Enter City and State or Zip" runat="server" 
            ontextchanged="tbZip_TextChanged"></asp:TextBox>
         <asp:Panel Style="overflow: auto;" ID="Panel1" runat="server"></asp:Panel>
    </div>   
</div>
