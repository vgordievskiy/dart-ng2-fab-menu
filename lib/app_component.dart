// Copyright (c) 2016, Vladislav Gordievskiy. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';

import 'Fab.dart';
import 'FabToggle.dart';
import 'FabButton.dart';

@Component(
    selector: 'my-app',
    template: '''
      <div>
        <fab dir="down">
          <fab-toggle>
            +
          </fab-toggle>
          <fab-button>
            <div>
            <i class="material-icons">done</i>
            </div>
          </fab-button>
          <fab-button>B</fab-button>
          <fab-button>C</fab-button>
          <fab-button>D</fab-button>
        </fab>
      </div>
    ''',
    directives: const [Fab, FabToggle, FabButton]
)
class AppComponent {}
