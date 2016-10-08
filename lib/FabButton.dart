library dart_ng2_fab_menu.fab_button;
import 'dart:html';
import 'package:angular2/core.dart';

@Component(
  selector: 'fab-button',
  template: '''
    <a
      #anchor
      href="#"
      class="fab-item"
      (click)="onClick.emit(\$event)">
      <span [class]="'icon-' + icon">
      </span>
      <ng-content></ng-content>
    </a>
  '''
)
class FabButton {
  @Input() String icon;
  @Output() EventEmitter onClick = new EventEmitter();
  @ViewChild('anchor') ElementRef element;
}
