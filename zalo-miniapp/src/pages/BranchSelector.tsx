import type { AppModule, Branch } from '../config';

interface Props {
  app: AppModule;
  onSelect: (branch: Branch) => void;
  onBack: () => void;
}

export default function BranchSelector({ app, onSelect, onBack }: Props) {
  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-blue-600 text-white p-4">
        <button onClick={onBack} className="text-sm mb-2 opacity-80">
          ← Quay lai
        </button>
        <h1 className="text-xl font-bold">{app.app_name}</h1>
        <p className="text-blue-100 text-sm">
          Chon chi nhanh de bat dau
        </p>
      </div>

      <div className="p-4 space-y-3">
        {app.branches.map((branch) => (
          <button
            key={branch.id}
            onClick={() => onSelect(branch)}
            className="w-full bg-white rounded-xl shadow-sm p-4 flex items-center gap-4 hover:shadow-md transition text-left"
          >
            <div className="w-12 h-12 bg-blue-100 text-blue-600 rounded-xl flex items-center justify-center font-bold text-lg">
              {branch.branch_code || '?'}
            </div>
            <div className="flex-1">
              <div className="font-bold text-gray-800">{branch.name}</div>
              {branch.address && (
                <div className="text-sm text-gray-500">{branch.address}</div>
              )}
              {branch.phone && (
                <div className="text-xs text-gray-400">{branch.phone}</div>
              )}
            </div>
            {branch.is_default && (
              <span className="text-xs bg-yellow-100 text-yellow-700 px-2 py-1 rounded-full">
                Mac dinh
              </span>
            )}
          </button>
        ))}
      </div>
    </div>
  );
}
