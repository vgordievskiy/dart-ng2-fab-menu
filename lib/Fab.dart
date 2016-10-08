library dart_ng2_fab_menu.fab;
import 'dart:html';
import 'package:angular2/core.dart';

import 'FabButton.dart';
import 'FabToggle.dart';

export 'FabButton.dart';
export 'FabToggle.dart';

@Component(
  selector: 'fab',
  styleUrls: const ['fab.css'],
  template: '''
    <nav
      class="fab-menu"
      [class.active]="active">
      <ng-content></ng-content>
    </nav>
  ''',
  directives: const [ FabToggle, FabButton ],
  encapsulation: ViewEncapsulation.None
)
class Fab implements AfterContentInit {
  @Input() String dir = 'right';
  @ContentChild(FabToggle) FabToggle toggle;
  @ContentChildren(FabButton) QueryList<FabButton> buttons;

  bool _active = false;
  ElementRef host;
  Element get element => host.nativeElement;
  bool get active => _active;

  set active(bool val) {
    this.updateButtons(val);
    this._active = val;
  }

  Fab(this.host);

  @override
  ngAfterContentInit() {
    toggle.onClick.listen((_) => this.active = !this.active);
  }

  @HostListener('click', const ['\$event.target'])
  onDocumentClick(target) {
    if(this.active && !this.element.contains(target)) {
      this.active = false;
    }
  }

  getTranslate(var idx) {
    if(dir == 'right') {
      return 'translate3d(${ 60 * idx }px,0,0)';
    } else if(this.dir == 'down') {
      return 'translate3d(0,${ 60 * idx }px,0)';
    } else {
      window.console.error('Unsupported direction for Fab; ${this.dir}');
    }
  }

  updateButtons(bool active) {
    var idx = 1;
    for(var btn in buttons) {
      CssStyleDeclarationBase style = btn.element.nativeElement.style;
      style.transitionDuration = active ? '${ 90 + (100 * idx) }ms' : '';
      style.transform = active ? getTranslate(idx) : '';
      idx++;
    }
  }
}

const List FAB_COMPONENTS = const [
  FabToggle,
  FabButton,
  Fab
];
