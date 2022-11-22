<?php

namespace Elgg\Blog\Forms;

/**
 * Prepare the fields for the blog/save form
 *
 * @since 5.0
 */
class PrepareFields {
	
	/**
	 * Prepare fields
	 *
	 * @param \Elgg\Event $event 'form:prepare:fields', 'blog/save'
	 *
	 * @return array
	 */
	public function __invoke(\Elgg\Event $event): array {
		$vars = $event->getValue();
		
		// input names => defaults
		$values = [
			'title' => null,
			'description' => null,
			'status' => 'published',
			'access_id' => ACCESS_DEFAULT,
			'comments_on' => 'On',
			'excerpt' => null,
			'tags' => null,
			'container_guid' => null,
			'guid' => null,
			'draft_warning' => '',
		];
		
		$blog = elgg_extract('entity', $vars);
		if ($blog instanceof \ElggBlog) {
			// load current blog values
			foreach (array_keys($values) as $field) {
				if (isset($blog->$field)) {
					$values[$field] = $blog->$field;
				}
			}
			
			if ($blog->status == 'draft') {
				$values['access_id'] = $blog->future_access;
			}
			
			// load the revision annotation if requested
			$revision = elgg_extract('revision', $vars);
			if ($revision instanceof \ElggAnnotation && $revision->entity_guid == $blog->guid) {
				$values['revision'] = $revision;
				$values['description'] = $revision->value;
			}
			
			// display a notice if there's an autosaved annotation
			// and we're not editing it.
			$auto_save = false;
			$auto_save_annotations = $blog->getAnnotations([
				'annotation_name' => 'blog_auto_save',
				'limit' => 1,
			]);
			if (!empty($auto_save_annotations)) {
				$auto_save = $auto_save_annotations[0];
			}
			
			if ($auto_save instanceof \ElggAnnotation && $revision instanceof \ElggAnnotation && $auto_save->id !== $revision->id) {
				$values['draft_warning'] = elgg_echo('blog:messages:warning:draft');
			}
		}
		
		return array_merge($vars, $values);
	}
}
