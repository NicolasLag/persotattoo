class AddProposalIdToMailboxerConversations < ActiveRecord::Migration
  def change
    add_column :mailboxer_conversations, :proposal_id, :integer
  end
end
