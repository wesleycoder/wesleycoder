import { Icon, List } from '@raycast/api'
import { usePromise } from '@raycast/utils'
import { getContents } from './files.ts'

const PrivacyLabels = {
  0: 'Public',
  1: 'Unlisted',
  2: 'Private',
}

const IconMap: Record<string, Icon> = {
  '/': Icon.Folder,
  default: Icon.Document,
}

export default function Browse() {
  const { data: contents, isLoading } = usePromise(getContents)
  return (
    <List isShowingDetail isLoading={isLoading}>
      {contents?.map((file) => (
        <List.Item
          key={file.id}
          title={file.name}
          icon={IconMap[file.type] || IconMap.default}
          detail={
            <List.Item.Detail
              metadata={
                <List.Item.Detail.Metadata>
                  <List.Item.Detail.Metadata.Label title='ID' text={file.id} />
                  <List.Item.Detail.Metadata.Label title='Name' text={file.name} />
                  <List.Item.Detail.Metadata.Label title='Parent' text={file.parent ?? '/'} />
                  <List.Item.Detail.Metadata.Label title='Path' text={file.path} />
                  <List.Item.Detail.Metadata.Label title='Privacy' text={PrivacyLabels[file.privacy] ?? '<unknown>'} />
                  <List.Item.Detail.Metadata.Label
                    title='Size'
                    text={file.size ? `${(file.size / 1024).toFixed(0)} KB` : '-'}
                  />
                  <List.Item.Detail.Metadata.Label title='Type' text={file.type === '/' ? 'Folder' : file.type} />
                  <List.Item.Detail.Metadata.Label title='Date' text={new Date(file.date).toLocaleString()} />
                </List.Item.Detail.Metadata>
              }
            />
          }
        />
      ))}
    </List>
  )
}
