/**
 * almond 0.2.5 Copyright (c) 2011-2012, The Dojo Foundation All Rights Reserved.
 * Available via the MIT or new BSD license.
 * see: http://github.com/jrburke/almond for details
 */

(function(){var n,e,r;(function(i){function t(n,e){return x.call(n,e)}function o(n,e){var r,i,t,o,u,c,f,s,l,p,a=e&&e.split("/"),d=y.map,b=d&&d["*"]||{};if(n&&"."===n.charAt(0))if(e){for(a=a.slice(0,a.length-1),n=a.concat(n.split("/")),s=0;n.length>s;s+=1)if(p=n[s],"."===p)n.splice(s,1),s-=1;else if(".."===p){if(1===s&&(".."===n[2]||".."===n[0]))break;s>0&&(n.splice(s-1,2),s-=2)}n=n.join("/")}else 0===n.indexOf("./")&&(n=n.substring(2));if((a||b)&&d){for(r=n.split("/"),s=r.length;s>0;s-=1){if(i=r.slice(0,s).join("/"),a)for(l=a.length;l>0;l-=1)if(t=d[a.slice(0,l).join("/")],t&&(t=t[i])){o=t,u=s;break}if(o)break;!c&&b&&b[i]&&(c=b[i],f=s)}!o&&c&&(o=c,u=f),o&&(r.splice(0,u,o),n=r.join("/"))}return n}function u(n,e){return function(){return d.apply(i,k.call(arguments,0).concat([n,e]))}}function c(n){return function(e){return o(e,n)}}function f(n){return function(e){h[n]=e}}function s(n){if(t(m,n)){var e=m[n];delete m[n],j[n]=!0,a.apply(i,e)}if(!t(h,n)&&!t(j,n))throw Error("No "+n);return h[n]}function l(n){var e,r=n?n.indexOf("!"):-1;return r>-1&&(e=n.substring(0,r),n=n.substring(r+1,n.length)),[e,n]}function p(n){return function(){return y&&y.config&&y.config[n]||{}}}var a,d,b,g,h={},m={},y={},j={},x=Object.prototype.hasOwnProperty,k=[].slice;b=function(n,e){var r,i=l(n),t=i[0];return n=i[1],t&&(t=o(t,e),r=s(t)),t?n=r&&r.normalize?r.normalize(n,c(e)):o(n,e):(n=o(n,e),i=l(n),t=i[0],n=i[1],t&&(r=s(t))),{f:t?t+"!"+n:n,n:n,pr:t,p:r}},g={require:function(n){return u(n)},exports:function(n){var e=h[n];return e!==void 0?e:h[n]={}},module:function(n){return{id:n,uri:"",exports:h[n],config:p(n)}}},a=function(n,e,r,o){var c,l,p,a,d,y,x=[];if(o=o||n,"function"==typeof r){for(e=!e.length&&r.length?["require","exports","module"]:e,d=0;e.length>d;d+=1)if(a=b(e[d],o),l=a.f,"require"===l)x[d]=g.require(n);else if("exports"===l)x[d]=g.exports(n),y=!0;else if("module"===l)c=x[d]=g.module(n);else if(t(h,l)||t(m,l)||t(j,l))x[d]=s(l);else{if(!a.p)throw Error(n+" missing "+l);a.p.load(a.n,u(o,!0),f(l),{}),x[d]=h[l]}p=r.apply(h[n],x),n&&(c&&c.exports!==i&&c.exports!==h[n]?h[n]=c.exports:p===i&&y||(h[n]=p))}else n&&(h[n]=r)},n=e=d=function(n,e,r,t,o){return"string"==typeof n?g[n]?g[n](e):s(b(n,e).f):(n.splice||(y=n,e.splice?(n=e,e=r,r=null):n=i),e=e||function(){},"function"==typeof r&&(r=t,t=o),t?a(i,n,e,r):setTimeout(function(){a(i,n,e,r)},4),d)},d.config=function(n){return y=n,y.deps&&d(y.deps,y.callback),d},r=function(n,e,r){e.splice||(r=e,e=[]),t(h,n)||t(m,n)||(m[n]=[n,e,r])},r.amd={jQuery:!0}})(),r("../../node_modules/almond/almond",function(){}),function(){r("jr/App",[],function(){return{init:function(){return console.log("init")}}})}.call(this),function(){e.config({paths:{jquery:"libs/jquery/jquery",underscore:"libs/underscore/underscore",backbone:"libs/backbone/backbone"},shim:{jquery:{exports:"$"},underscore:{exports:"_"},backbone:{deps:["jquery","underscore"],exports:"Backbone"}}}),e(["jr/App"],function(n){return n.init()})}.call(this),r("main",function(){})})();