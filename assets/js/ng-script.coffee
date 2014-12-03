class InterpolateProvider
  constructor: ($interpolateProvider) ->
    $interpolateProvider.startSymbol '<['
    $interpolateProvider.endSymbol ']>'

class SkillsController
  constructor: ($scope, $http, $sce, $timeout) ->
    $scope.activePage = '#'
    $http.get('data.json').success (data)->
      $scope.data = data
    $scope.toggleCate = (cate) ->
      if $scope.activeCate == cate
        $scope.activeCate = '#'
      else
        $scope.activeCate = cate
    $scope.togglePage = (page) ->
      $scope.activePage = page
#    $scope.$watch('activePage', (newValue, oldValue) ->
#      console.log('new value is ' + newValue)
#    )
    $scope.renderPage = (url) ->
      $http.get('jsondata/' + url).success (data) ->
        $scope.pagehtml = data.content
#    $scope.renderHTML = ->
#      $compile($scope.pagehtml)
#      $sce.trustAsHtml($scope.pagehtml)
    $scope.aniClick = (data) ->
      $timeout ->
        angular.element(document.getElementById(data)).triggerHandler('click')
      , 0
    $scope.aniLink = (data) ->
      $timeout ->
        rawEl = document.getElementById(data)
        rawPel = document.getElementById(rawEl.getAttribute('pid'))
        angular.element(rawPel).triggerHandler('click')
        angular.element(rawEl).triggerHandler('click')
      , 0


#class myDirective
#  constructor: (myService) ->
#    @service = myService
#  restrict: 'A'
#  replace: true
#  link: (scope, element, attr) ->
#    scope.$watch 'pagehtml', ->
#      element.html(scope.pagehtml)
#      @service(element.content)(scope)

angular.module('skillsApp', [])
.config(['$interpolateProvider', InterpolateProvider])
.controller('skillsController', ['$scope', '$http', '$sce', '$timeout', '$compile', SkillsController])
.directive('myservice', ($compile) ->
  restrict: 'A'
  replace: true
  link: (scope, ele, attr) ->
    scope.$watch 'pagehtml', ->
#      ele.html(scope.pagehtml)
      ele.empty()
      ele.append($compile(scope.pagehtml)(scope))
)
#.directive('myservice', ($compile) -> new myDirective($compile))