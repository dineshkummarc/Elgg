��    p      �                �        �     �  #   �          0  �   L     3	  8   L	    �	  �   �
     J  F   W     �     �  �   �     �     �  @   �  I   �  �   +  %     %   +  ]   Q     �  /   �  �   �  ,        �  /   �     �       �  -  �   �  �   �  �   _  F   /  �   v  �    �   �  J   �  a   �     R  ]   ^  Q   �       �   -  @   �  	   ;  L   E  V   �  �   �  �   �  �  �  }   ]     �  �   �  �   �    f   Y   �!  �  �!     �#     �#  O  �#     
%  Q   "%  (  t%  &   �&  n   �&  �   3'  w  �'  v   `)  f   �)     >*     W*  N   _*  �   �*  \   �+  �   �+  0  |,  �   �-  �   ;.  �   �.     �/  S   �/  e   0  �   r0  2  �0  �   02  H   �2  q   3  d  u3  g   �4  �   B5  �   �5     e6  	   s6  -   }6  	   �6  ?   �6  �   �6  �   �7  c   d8  g   �8  P   09  �   �9  Z   }:  :   �:     ;     +;     A;  �  [;  �   .=     �=     >  +   >  (   E>  #   n>  	  �>  1   �?  B   �?  Q  @  �   cA     YB  D   gB  (   �B     �B  �   �B     �C     �C  A   �C  H   (D  "  qD  1   �E  /   �E  t   �E  !   kF  =   �F  �   �F  :   oG     �G  6   �G     �G  '   H  *  BH  �   mJ  �   \K  �   *L  M   M  �   YM  "  �M  �   P  W   �P  g   IQ     �Q  �   �Q  `   CR     �R  �   �R  U   �S     �S  Q   T  Y   ]T  �   �T  ]  �U  �  �V  �   �X     Y  �   �Y    mZ  F  v[  i   �\  l  ']     �_     �_  �  �_     ma  W   �a  j  �a  .   Ic  }   xc  �   �c  �  �d  �   �f  e   g     �g     �g  P   �g  �   �g  �   �h  �   ki  R  j  �   ok  �   l  �   �l     �m  b   �m     En  �   �n  R  }o  �   �p  O   kq  ~   �q  �  :r  l   �s  �   et  �   u     �u  	   �u  A   �u     v  ;   .v  �   jv  �   w     �w  w   sx  n   �x  .  Zy  p   �z  A   �z     <{     T{     j{   (If you're wondering about the "``default``" in ``/views/default/``, you can create alternative views. RSS, OpenDD, FOAF, mobile and others are all valid view types.) :doc:`/admin/plugins` :doc:`/guides/views` :doc:`Install Elgg</intro/install>` Add the WYSIWYG library code Adding the widget view code All forms in Elgg should try to use the provided input views located in ``views/default/input``. If these views are used, then it is simple for plugin authors to replace a view, in this case ``input/longtext``, with their wysiwyg. Allow user customization Any output from this view will become your new homepage. As you can see in the above code, Elgg objects have several fields built into them. The title of the my_blog post is stored in the ``title`` field while the body is stored in the ``description`` field. There is also a field for tags which are stored as metadata. As you can see in the previous section, each my\_blog post is passed to the object view as ``$vars['entity']``. (``$vars`` is an array used in the views system to pass variables to a view.) Basic Widget Before anything else, you need to :doc:`install Elgg</intro/install>`. Build your own wysiwyg plugin. Building a Blog Plugin Click on the edit link on the toolbar of the widget that you've created. You will notice that the only control it gives you by default is over access (over who can see the widget). Composer file Contents Create ``/mod/my_blog/views/default/resources/my_blog/all.php``: Create ``mod/hello/views/default/resources/hello.php`` with this content: Create a file at ``/mod/my_blog/views/default/forms/my_blog/save.php`` that contains the form body. The form should have input fields for the title, body and tags of the my_blog post. It does not need form tag markup. Create a page for composing the blogs Create a page for viewing a blog post Create a widget that will display “Hello, World!” and optionally any text the user wants. Create elgg-plugin.php Create the action file for saving the blog post Create the file ``/mod/my_blog/views/default/resources/my_blog/add.php``. This page will view the form you created in the above section. Create the form for creating a new blog post Create the object view Create the plugin's directory and composer file Customizing the Home Page Displaying a list of blog posts Elgg automatically scans particular directories under plugins looking for particular files. :doc:`/guides/views` make it easy to add your display code or do other things like override default Elgg behavior. For now, we will just be adding the view code for your widget. Create a file at ``/views/default/widgets/helloworld/content.php``. “helloworld” will be the name of your widget within the hello plugin. In this file add the code: Elgg is bundled with a plugin for CKEditor_, and previously shipped with TinyMCE_ support. However, if you have a wysiwyg that you prefer, you could use this tutorial to help you build your own. Elgg needs to be told explicitly that the plugin contains a widget so that it will scan the widget views directory. This is done by registering the widget in your ``elgg-plugin.php``: Elgg requires that your plugin has a composer file that contains information about the plugin. Therefore, in the directory you just created, create a file called ``composer.json`` and copy this code into it: Filter which is left empty because there's currently nothing to filter Finally, activate the plugin through your Elgg administrator page: ``https://elgg.example.com/admin/plugins`` (the new plugin appears at the bottom). First, choose a simple and descriptive name for your plugin. In this tutorial, the name will be ``my_blog``. Then, create a directory for your plugin in the ``/mod/`` directory found in your Elgg installation directory. Other plugins are also located in ``/mod/``. In this case, the name of the directory should be ``/mod/my_blog/``. This directory is the root of your plugin and all the files that you create for the new plugin will go somewhere under it. First, create a directory that will contain the plugin's files. It should be located under the ``mod/`` directory which is located in your Elgg installation directory. So in this case, create ``mod/hello/``. For real widgets, it is always a good idea to support :doc:`/guides/i18n`. Go to your Elgg site's administration page, list the plugins and activate the ``my_blog`` plugin. Hello world In Elgg, widgets are those components that you can drag onto your profile or admin dashboard. In this tutorial we will pretend your site's URL is ``https://elgg.example.com``. Integrating a Rich Text Editor It is recommended that you make your plugin translatable by using ``elgg_echo()`` whenever there is a string of text that will be shown to the user. Read more at :doc:`Internationalization</guides/i18n>`. It is time to tell Elgg how to apply TinyMCE to longtext fields. Last step Let's also create a page that lists my\_blog entries that have been created. Next, in the root of the plugin, create the plugin's composer file, ``composer.json``. Next, you will need to register your route to return the new page when the URL is set to ``/my_blog/all``. Configure the ``routes`` section in ``elgg-plugin.php`` to contain the following: Notice how the form is calling ``elgg_view_field()`` to render inputs. This helper function maintains consistency in field markup, and is used as a shortcut for rendering field elements, such as label, help text, and input. See :doc:`/guides/actions`. Notice the relationship between the values passed to the 'name' and the 'value' fields of input/text. The name of the input text box is ``params[message]`` because Elgg will automatically handle widget variables put in the array ``params``. The actual php variable name will be ``message``. If we wanted to use the field ``greeting`` instead of ``message`` we would pass the values ``params[greeting]`` and ``$widget->greeting`` respectively. Now go to your profile page using a web browser and add the “hello, world” widget. It should display “Hello, world!”. Now that you have: Now to display the user's message we need to modify content.php to use this *message* variable. Edit ``/views/default/widgets/helloworld/content.php`` and change it to: Now you need to upload TinyMCE into a directory in your plugin. We strongly encourage you to use ``composer`` to manage third-party dependencies, since it is so much easier to upgrade and maintain that way: Now, if ``full_view`` is ``true`` (as it was pre-emptively set to be in :ref:`this section <tutorials/blog#view>`), the object view will show the post's content and tags (the title is shown by ``view.php``). Otherwise the object view will render just the title and tags of the post. Now, if the URL contains ``/my_blog/all``, the user will see an "All Site My_Blogs" page. Objects in Elgg are a subclass of something called an "entity". Users, sites, and groups are also subclasses of entity. An entity's subtype allows granular control for listing and displaying, which is why every entity should have a subtype. In this tutorial, the subtype "``my_blog``\ " identifies a my\_blog post, but any alphanumeric string can be a valid subtype. When picking subtypes, be sure to pick ones that make sense for your plugin. Prerequisites: Registering a route Registering the save action will make it available as ``/action/my_blog/save``. By default, all actions are available only to logged in users. If you want to make an action available to only admins or open it up to unauthenticated users, you can pass ``['access' => 'admin']`` or ``['access' => 'public']`` when registering the action. Registering your widget See :doc:`Plugins</guides/plugins>` for more information about the composer file. Suppose you want to allow the user to control what greeting is displayed in the widget. Just as Elgg automatically loads ``content.php`` when viewing a widget, it loads ``edit.php`` when a user attempts to edit a widget. Put the following code into ``/views/default/widgets/helloworld/edit.php``: Tell Elgg when and how to load TinyMCE That's it! Now every time someone uses ``input/longtext`` TinyMCE will be loaded and applied to that textarea. The ``/mod/my_blog/elgg-plugin.php`` file is used to declare various functionalities of the plugin. It can, for example, be used to configure entities, actions, widgets and routes. The ``elgg_list_entities`` function grabs the latest my_blog posts and passes them to the object view file. Note that this function returns only the posts that the user can see, so access restrictions are handled transparently. The function (and its cousins) also transparently handles pagination and even creates an RSS feed for your my\_blogs if you have defined that view. The action file will save the my_blog post to the database. Create the file ``/mod/my_blog/actions/my_blog/save.php``: The code creates an array of parameters to be given to the ``elgg_view_layout()`` function, including: The contents of the page The end The form's action will be ``"<?= elgg_get_site_url() ?>action/my_blog/save"``. The function ``elgg_view_form("my_blog/save")`` views the form that you created in the previous section. It also automatically wraps the form with a ``<form>`` tag and the necessary attributes as well as anti-csrf tokens. The instructions are detailed enough that you don't need much previous experience with Elgg. The last line takes the tags on the my\_blog post and automatically displays them as a series of clickable links. Search is handled automatically. The list function can also limit the my_blog posts to those of a specified user. For example, the function ``elgg_get_logged_in_user_guid`` grabs the Global Unique IDentifier (GUID) of the logged in user, and by giving that to ``elgg_list_entities``, the list only displays the posts of the current user: The next step is to register a route which has the purpose of handling request that users make to the URL ``https://elgg.example.com/hello``. The page to create a new my\_blog post should now be accessible at ``https://elgg.example.com/my_blog/add``, and after successfully saving the post, you should see it viewed on its own page. The reason we set the 'value' option of the array is so that the edit view remembers what the user typed in the previous time he changed the value of his message text. The title of the page Then, in your plugin's ``elgg-plugin.php`` file extend the ``input/longtext`` view: There's much more that could be done, but hopefully this gives you a good idea of how to get started. This creates the basic layout for the page. The layout is then run through ``elgg_view_page()`` which assembles and outputs the full page. This page has much in common with the ``add.php`` page. The biggest differences are that some information is extracted from the my_blog entity, and instead of viewing a form, the function ``elgg_view_entity`` is called. This function gives the information of the entity to something called the object view. This registration tells Elgg that it should call the resource view ``hello`` when a user navigates to ``https://elgg.example.com/hello``. This tutorial assumes you are familiar with basic Elgg concepts such as: This tutorial shows you how to create a new plugin that consists of a new page with the text "Hello world" on it. This tutorial will teach you how to create a simple blog plugin. The basic functions of the blog will be creating posts, saving them and viewing them. The plugin duplicates features that are found in the bundled ``blog`` plugin. You can disable the bundled ``blog`` plugin if you wish, but it is not necessary since the features do not conflict each other. This will add these words to the widget canvas when it is drawn. Elgg takes care of loading the widget. To be able to view a my_blog post on its own page, you need to make a view page. Create the file ``/mod/my_blog/views/default/resources/my_blog/view.php``: To override the homepage, just override Elgg's ``resources/index`` view  by creating a file at ``/views/default/resources/index.php``. Trying it out Tutorials Update ``elgg-plugin.php`` to look like this: View file Walk through all the required steps in order to customize Elgg. We're going to do that by extending the ``input/longtext`` view and including some javascript. Create a view ``tinymce/longtext`` and add the following code: When ``elgg_view_entity`` is called or when my_blogs are viewed in a list for example, the object view will generate the appropriate content. Create the file ``/mod/my_blog/views/default/object/my_blog.php``: You can now go to the address ``https://elgg.example.com/hello/`` and you should see your new page! You can see a complete list of input views in the ``/vendor/elgg/elgg/views/default/input/`` directory. You can take a similar approach with any other page in Elgg or official plugins. You might also want to update the object view to handle different kinds of viewing, because otherwise the list of all my_blogs will also show the full content of all my_blogs. Change ``/mod/my_blog/views/default/object/my_blog.php`` to look like this: You should now be able to enter a message in the text box and see it appear in the widget. You should review those if you get confused along the way. created your start file intialized the plugin uploaded the wysiwyg code Project-Id-Version: Elgg master
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2022-12-07 14:54+0100
PO-Revision-Date: 2021-06-09 13:32+0000
Last-Translator: Jeroen Dalsem, 2021
Language: fr
Language-Team: French (https://www.transifex.com/elgg/teams/11337/fr/)
Plural-Forms: nplurals=3; plural=(n == 0 || n == 1) ? 0 : n != 0 && n % 1000000 == 0 ? 1 : 2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.9.1
 (Si vous vous interrogez sur le "``default``" dans ``/views/default/``, vous pouvez créer des vues alternatives. RSS, OpenDD, FOAF, vue mobile et d'autres sont divers types de vues valides.) :doc:`/admin/plugins` :doc:`/guides/views` :doc:`Installation de Elgg</intro/install>` Ajoutez la bibliothèque de code WYSIWYG Ajouter le code de la vue du widget Tous les formulaires dans Elgg devraient essayer d'utiliser les vues de saisie situées dans ``views/default/input``. Si ces vues sont utilisées, il est plus aisé pour les auteurs de plugins de remplacer une vue, ici ``input/longtext``, par leur vue avec wysiwyg. Permettre les personnalisations par l'utilisateur Toute sortie de cette vue deviendra votre nouvelle page d'accueil. Comme vous pouvez le voir dans le code ci-dessus, les objets Elgg disposent de plusieurs champs intégrés. Le titre de l'article my_blog est conservé dans le champs ``title`` tandis que le contenu est conservé dans le champs ``description``. Il y a également un champs pour des tags, qui sont stockés sous la forme de métadonnées. Comme vous pouvez le voir dans la section précédente, chaque article my\_blog est passé à la vue de l'objet sous la forme ``$vars['entity']``. (``$vars`` est un tableau utilisé dans le système de vues pour passer des variables à une vue.) Widget simple Avant toute chose, vous devez :doc:`installer Elgg</intro/install>`. Construisez votre propre plugin wysiwyg. Construire un plugin de Blog Cliquez sur le lien d'édition dans la barre d'outils du widget que vous avez créé. Vous allez remarquer que le seul contrôle qu'il vous offre par défaut est celui du niveau d'accès (sur qui peut voir le widget). Fichier composer Contenus Créez ``/mod/my_blog/views/default/resources/my_blog/all.php`` : Créez ``mod/hello/views/default/resources/hello.php`` avec ce contenu : Créez un fichier `/mod/my_blog/views/default/forms/my_blog/save.php`` qui contiendra le corps du formulaire. Le formulaire doit avoir des champs de saisie pour le titre, le contenu et les tags de l'article de blog my_blog. Il n'est pas nécessaire d'ajouter les balises form du formulaire. Créez une page pour écrire les articles de blog Créez une page pour afficher l'article de blog Créez un widget qui va afficher “Hello, World!”, et en option n'importe quel texte souhaité par l'utilisateur. Créer le fichier elgg-plugin.php Créez le fichier d'action pour enregistrer l'article de blog Créez le fichier ``/mod/my_blog/views/default/resources/my_blog/add.php``. Cette page va afficher le formulaire que vous avez créé dans la section précédente. Créez le formulaire pour créer un nouvel article de blog Créez la vue de l'objet Créez le répertoire du plugin et le fichier composer Personnaliser la page d'accueil Afficher une liste des articles de blog Elgg scanne automatiquement certains répertoires des plugins pour trouver des fichiers spécifiques. Les vues :doc:`/guides/views` facilitent l'ajout de votre propre code d'affichage, ou la possibilité de faire d'autres choses telles que surcharger le comportement par défaut de Elgg. Pour le moment, nous allons simplement ajouter le code d'affichage pour votre widget. Créez un fichier ``/views/default/widgets/helloworld/content.php``. “helloworld” sera le nom de votre widget à l'intérieur du plugin hello. Dans ce fichier ajoutez le code : Elgg est distribué avec un plugin pour CKEditor_, et était précédemment distribué avec le support de TinyMCE_. Cependant, s'il y a un éditeur wysiwyg que vous préférez, vous pourriez utiliser ce tutoriel pour construire le vôtre. Elgg a besoin qu'on lui indique explicitement que le plugin contient un widget afin qu'il scanne le répertoire des vues des widgets. Cela se fait en enregistrant le widget dans votre ``elgg-plugin.php`` : Elgg a besoin que votre plugin dispose d'un fichier composer qui contient des informations sur le plugin. A cette fin, créez un fichier nommé ``composer.json`` dans le répertoire de votre plugin et copiez ce code dedans : Un filter qui est laissé vide puisqu'il n'y a pour le moment rien à filtrer Pour terminer, activez le plugin depuis la page d'administration de Elgg : `https://elgg.example.com/admin/plugins`` (le nouveau plugin apparaît en bas) Tout d'abord, choisissez un nom simple et descriptif pour votre plugin. Dans ce tutoriel, le nom sera ``my_blog``. Puis créez un répertoire pour votre plugin dans le répertoire ``/mod/`` qui se trouve dans le répertoire d'installation de Elgg. D'autres plugins sont également situés dans ``/mod/``. Dans notre cas, le nom de ce répertoire devrait être ``/mod/my_blog/``. Ce répertoire constitue la racine de votre plugin, et tous les fichiers que vous allez créer pour votre nouveau plugin vont l'être quelque part dans ce répertoire. Tout d'abord, créez un répertoire qui va contenir les fichiers du plugin. Il devrait être placé dans le répertoire ``mod/`` situé dans le répertoire d'installation de Elgg. Dans notre cas, créez ``mod/hello/``. Pour de vrais widgets, c'est toujours une bonne idée de respecter :doc:`/guides/i18n`. Rendez-vous sur la page d'administration de Elgg, listez les plugins, et activez le plugin ``my_blog``. Hello world Dans Elgg, les widgets sont ces composants que vous pouvez déplacer sur votre page de profil ou le tableau de bord d'administration. Dans ce tutoriel, nous allons supposer que l'URL de votre site est ``https://elgg.example.com``. Intégrer un éditeur de texte Il est recommandé que vous rendiez votre plugin traduisible en utilisant ``elgg_echo()`` à chaque fois qu'une chaîne de texte sera affichée à l'utilisateur. Lisez-en plus sur l':doc:`Internationalisation</guides/i18n>`. Il est temps de dire à Elgg comment appliquer TinyMCE aux champs de saisie de texte. Dernière étape Créons également une page qui liste les entrées my_blog qui ont été créées Ensuite, à la racine du plugin, créez le fichier composer du plugin, ``composer.json``. Ensuite, vous devrez enregistrer votre route pour renvoyer la nouvelle page lorsque l'URL est définie sur ``/my_blog/all``. Configurez la section ``routes`` dans ``elgg-plugin.php`` pour contenir les éléments suivants : Notez comment le formulaire appelle ``elgg_view_field()`` pour afficher les champs de saisie. Cette fonction d'aide permet de maintenir la cohérence dans les balises des champs de saisie, et est utilisée comme raccourci pour afficher des éléments des champs, tels que le label, le texte d'aide et le champ de saisie. Voir :doc:`/guides/actions`. Notez la relation entre les valeurs passées aux champs nom 'name' et valeur 'value' de input/text. Le nom du champ de la boîte de saisie de texte est  ``params[message]`` parce que Elgg va automatiquement gérer les variables des widgets placées dans le tableau ``params``. Le nom de la variable PHP correspondante sera ``message``. Si nous voulions utiliser le champ ``greeting`` au lieu de ``message`` nous passerions respectivement les valeurs ``params[greeting]`` et ``$widget->greeting``. Rendez-vous maintenant sur votre page de profil avec un navigateur web et ajoutez le widget  “hello, world”. Il devrait afficher “Hello, world!”. Maintenant que vous avez : Maintenant pour afficher le message de l'utilisateur nous devons modifier content.php pour qu'il utilise cette variable *message*. Éditez ``/views/default/widgets/helloworld/content.php`` et modifiez-le pour : Vous devez maintenant télécharger TinyMCE dans un répertoire de votre plugin. Nous vous encourageons fortement à utiliser ``composer`` pour gérer les dépendances tierces, car il est tellement plus facile de mettre à niveau et de maintenir de cette façon : Désormais, si ``full_view`` est à ``true`` (tel qu'il avait été préalablement défini dans :ref:`cette section <tutorials/blog#view>`), la vue de l'objet va afficher le contenu et les tags de l'article (le titre est affiché par ``view.php``). Sinon la vue de l'objet ne va afficher que le titre et les tags de l'article. Désormais, si l'URL contient ``/my_blog/all``, l'utilisateur verra une page "Tous les My_Blogs du site". Les objets dans Elgg sont une sous-classe de quelque chose appelé une entité "entity". Les utilisateurs, sites et groupes sont également des sous-classes d'une entité. Le sous-type "subtype" d'une entité permet un contrôle granulaire pour les listes et l'affichage, c'est pourquoi chaque entité devrait avoir un sous-type. Dans ce tutoriel, le sous-type "``my_blog``\ " permet d'identifier un article my\_blog, mais toute chaîne de caractères alphanumérique peut constituer un sous-type valide. Lorsque vous choisissez des sous-types, veuillez vous assurer d'en choisir qui soient cohérents avec votre plugin. Prérequis : Enregistrer une route L'enregistrement de l'action de sauvegarde va la rendre disponible via ``/action/my_blog/save``. Par défaut, toutes les actions ne sont disponibles qu'aux utilisateurs identifiés. Si vous souhaitez rendre une action disponible aux seuls administrateurs ou l'ouvrir également à des visiteurs non identifiés, vous pouvez passer respectivement ``['access' => 'admin']`` ou ``['access' => 'public']`` lors de enregistrement de l'action. Enregistrer votre widget Voyez :doc:`Plugins</guides/plugins>` pour plus d'informations sur le fichier composer. Supposez que vous voulez permettre à l'utilisateur de contrôler quel message d'accueil est affiché dans le widget. De la même manière que Elgg charge automatiquement ``content.php`` pour afficher un widget, il charge ``edit.php`` quand un utilisateur tente de modifier un widget. Ajoutez le code suivant dans ``/views/default/widgets/helloworld/edit.php`` : Dites à Elgg quand et comment charger TinyMCE C'est ça! Maintenant, chaque fois que quelqu'un utilise ``input/longtext`` TinyMCE sera chargé et appliqué à ce textarea. Le fichier ``/mod/my_blog/elgg-plugin.php`` est utilisé pour déclarer diverses fonctionnalités du plugin. Il peut, par exemple, être utilisé pour configurer des entités, des actions, des widgets et des routes. La fonction ``elgg_list_entities`` prend les derniers articles my_blog et les passe à la vue d'affichage de l'objet. Notez que cette fonction ne retourne que les articles que l'utilisateur a le droit de voir, aussi le contrôle d'accès est géré de manière transparente. La fonction (et ses cousines) gère également de manière transparente la pagination, et crée même un flux RSS pour votre my\_blogs si vous avez défini cette vue. Le fichier d'action va enregistrer l'article de blog my_blog dans la base de données. Créez le fichier ``/mod/my_blog/actions/my_blog/save.php``: Le code crée un tableau de paramètres à passer à la fonction ``elgg_view_layout()``, comprenant : Le contenu de la page FIN L'action du formulaire sera ``"<?= elgg_get_site_url() ?>action/my_blog/save"``. La fonction ``elgg_view_form("my_blog/save")`` affiche le formulaire que vous avez créé dans la section précédente. Elle ajoute automatiquement au formulaire la balise ``<form>`` avec les attributs nécessaires ainsi que des jetons anti-csrf. Les instructions sont suffisamment détaillées pour que vous n'ayez pas besoin de beaucoup d'expérience de développement avec Elgg. La dernière ligne prend les tags de l'article my\_blog et les affiche automatiquement sous la forme d'une série de liens cliquables. La recherche est gérée automatiquement. La fonction de liste peut également limiter les articles my_blog à ceux d'un utilisateur spécifique. Par exemple, la fonction ``elgg_get_logged_in_user_guid`` récupère l'identifiant unique (GUID) de l'utilisateur connecté, et en le passant à ``elgg_list_entities`` la liste n'affichera que les articles de l'utilisateur connecté : L'étape suivante est d'enregistrer une route dont l'objectif est de traiter les requêtes que les utilisateurs font vers l'URL ``https://elgg.example.com/hello``. La page pour créer un nouvel article my\_blog devrait désormais être accessible via ``https://elgg.example.com/my_blog/add``, et après avoir enregistré l'article, vous devriez le voir affiché sur sa propre page. La raison pour laquelle nous définissons l'option 'value' du tableau est que ceci indique à la vue d'édition de se souvenir de ce que l'utilisateur a saisi la dernière fois qu'il a modifié la valeur du texte du message. Le titre de la page Ensuite, dans le fichier ``elgg-plugin.php`` de votre plugin étendez la vue ``input/longtext`` : Il y a tant d'autres choses qui peuvent être faites ! Nous espérons que ceci vous donne une bonne idée de comment démarrer. Ceci crée la mise en page générale "layout" de base pour la page. Cette mise en page est ensuite passée à travers ``elgg_view_page()`` qui assemble et génère la page complète. Cette page a beaucoup de points communs avec la page ``add.php``. Les principales différences sont que les informations sont extraites depuis l'entité my_blog, et qu'au lieu d'afficher un formulaire, la fonction ``elgg_view_entity`` est appelée. Cette fonction donne les informations de l'entité à ce qu'on appelle la vue de l'objet. Cet enregistrement indique à Elgg qu'il devrait appeler la vue ressource ``hello`` quand un utilisateur navigue vers  ``https://elgg.example.com/hello``. Ce tutoriel suppose que vous connaissez les concepts de base de Elgg tels que : Ce tutoriel vous montre comment créer un nouveau plugin qui consiste en une nouvelle page qui affiche le texte "Hello world". Ce tutoriel va vous apprendre à créer un plugin de blog simple. Les fonctionnalités de base du blog seront de créer des articles, les enregistrer et les afficher. Le plugin duplique des fonctionnalités présentes dans le plugin inclus ``blog``. Vous pouvez désactiver le plugin de ``blog`` inclus si vous le souhaitez, mais ce n'est pas nécessaire dans la mesure où les fonctionnalités ne seront pas en conflit les unes avec les autres. Ceci va ajouter ces mots au canevas du widget lorsqu'il sera affiché. Elgg prend soin de charger le widget. Pour pouvoir afficher un article my_blog sur sa propre page, vous devez créer une page d'affichage. Créez le fichier ``/mod/my_blog/views/default/resources/my_blog/view.php``: Pour remplacer la page d'accueil, surchargez simplement la vue de Elgg ``resources/index`` en créant un fichier à ``/views/default/resources/index.php``. Tester le plugin Tutoriels Mettez à jour ``elgg-plugin.php`` pour qu'il ressemble à ceci : Fichier de la vue d'affichage Suivez toutes les étapes requises pour personnaliser Elgg. Nous allons le faire en étendant la vue ``input/longtext`` et en incluant du javascript. Créez une vue ``tinymce/longtext`` et ajoutez le code suivant : Quand ``elgg_view_entity`` est appelé ou quand des articles my_blogs sont affichés dans une liste par exemple, la vue de l'objet va générer le contenu approprié. Créez le fichier ``/mod/my_blog/views/default/object/my_blog.php`` : Vous pouvez maintenant vous rendre sur l'adresse ``https://elgg.example.com/hello/`` et vous devriez voir votre nouvelle page ! Vous pouvez voir une liste complète des vues de saisie dans le répertoire ``/vendor/elgg/elgg/views/default/input/``. Vous pouvez utiliser une approche similaire avec n'importe quelle autre page de Elgg ou des plugins officiels. Vous pouvez aussi choisir de mettre à jour la vue de l'objet pour gérer différents types d'affichage, faute de quoi la liste de tous les my_blogs va également afficher le contenu complet de tous les articles. Modifiez ``/mod/my_blog/views/default/object/my_blog.php`` pour qu'il ressemble à ceci : Vous devriez maintenant pouvoir saisir un message dans la boîte de texte et le voir apparaître dans le widget. Vous devriez les revoir si cela devient confus en cours de route. créé le fichier start initialisé le plugin chargé le code wysiwyg 