library dart_ng2_fab_menu.fab_toggle;
import 'dart:html';
import 'package:angular2/core.dart';

@Component(
  selector: 'fab-toggle',
  template: '''
    <div
      href=""
      class="fab-toggle"
      (click)="onClick.emit(\$event)">
      <span
        [class]="'icon-' + icon">
      </span>
      <ng-content></ng-content>
    </div>
  '''
)
class FabToggle {
  @Input() String icon = '';
  @Output() EventEmitter onClick = new EventEmitter();
}
