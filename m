Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4604391E4E;
	Thu,  6 Aug 2026 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030127; cv=none; b=KLiGPKh6W8z/Wv7SeFdWK43TNBU8n0c3iOnIpAMgVLfyRhawoJ7ss1FaRtyTv/Ifntbjom02y7jLFm/5h3Xlx1SCbvIkN46JO+00PlUOLmEqZEM7JqW5huhCRRWhUfinptfMT7Zu+FCJhXGOrEBcqHewNbmRT2WAVmhjFMUsWkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030127; c=relaxed/simple;
	bh=97rXyYGAbf+UW53T2G9gDyGIgLk+bK8TQS1U6+lks6c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h8fsTGI2v/wsWwT3EYCp996jUmK8I6hiOAlMDiSyhsb1PnlbgRqj0Equ79suzVktfpj3XpgEhHVFkYo8cZ4CEo7sGSYMnaLOv8H+6YH563vRjUmBJ2fG903DhrY+Curi/0TFELyZ9ml/jC01R6bWMgaKqlW1NC+gYk3dxlJcN/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRDnI40S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRDnI40S"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42DB0C2BCC7;
	Thu,  6 Aug 2026 15:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786030127;
	bh=97rXyYGAbf+UW53T2G9gDyGIgLk+bK8TQS1U6+lks6c=;
	h=From:Subject:Date:To:Cc:From;
	b=LRDnI40SUVOKDS5Z3QK3Gf68m58P+JIqLdq08I9knGIppbPwVUh564mLz0wQh1GJz
	 84yXR9wACZHuPMAXxFpqwbddyM5nZV+D4IBbd0yndmYzXUjuu+rvJaQyFY6p5vQ1+I
	 coBd1PX0Xj4Z9pmZoFFIw+UUbPZTInneMz32HPq/i2xXg77wIMHAh7PQznoK5IsrnQ
	 vP8Ut1TWRjH2CbBn+o3WtxgGxQ8lMwT8KLMiOGx4muQZQWNbmjIi6TMqILY7QlCxj8
	 oG6bWNKtJaumpo9jg3LlYgjFvGgfgKZzbL/rNTkq/ZWx3UbRYKGp9y8JQW3BBKXNro
	 im2NnTFqHYh6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB27C56208;
	Thu,  6 Aug 2026 15:28:47 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH 0/6] Apple NVMe fixes for macOS 15+ firmware / M4 support
Date: Thu, 06 Aug 2026 17:27:32 +0200
Message-Id: <20260806-b4-nvme-fwabi-v1-0-bde19ce8db04@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQoCIRCA4VeROTcwmoj0KtFBd8eaIAutLRDff
 W33+B3+v0HlIlzhpBoUXqTKMw/og4LpFvKVUeZhMGQceXIYLeblwZi+IQoS0dE7bX00GkbzKpz
 kt/3Ol931E+88vf8T6H0FOg1ZLXEAAAA=
X-Change-ID: 20260806-b4-nvme-fwabi-000386148b21
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1338; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=97rXyYGAbf+UW53T2G9gDyGIgLk+bK8TQS1U6+lks6c=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ1bJCjX5qiO3ThWxxLc1vD5y+Mjzz90rn7IxlvtXiEdw/
 5KQ1t3RUcrCIMbFICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZhI43dGhrXse6xOvZooXxUo
 s2rZPyGBhSr2FxoznN6ZiOws3CRzYAUjw+vmOHlN3coX8+KtjMo8Hrjf0lwpkLusl2lJpdqnStl
 qNgA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Hi,

This series fixes a bunch of bugs that were working fine with M1/M2 NVMe
controllers with older firmware but are now starting to bite us.
With macOS 15 a new firmware is installed for the controller and both
XNU and the controller are a bit more strict now. This firmware is
required once we add M4 support.

The first patch fixes a panic that can happen when the controller fails
to initialize, which now happens for the first time with the new
firmware. The other fixes then make it work again.

Best,

Sven

Signed-off-by: Sven Peter <sven@kernel.org>
---
Sven Peter (6):
      nvme-apple: Destroy the admin queue on removal
      nvme-apple: Don't set a DMA direction for commands without a data transfer
      nvme-apple: Never set the opcode in the NVMMU TCB
      nvme: Add a quirk for page aligned admin queue buffers
      nvme-apple: Require page aligned buffers on the admin queue
      nvme-apple: Drop the PRP null check chicken bit

 drivers/nvme/host/apple.c | 32 +++++++++++++++-----------------
 drivers/nvme/host/core.c  |  5 ++++-
 drivers/nvme/host/nvme.h  |  7 +++++++
 3 files changed, 26 insertions(+), 18 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260806-b4-nvme-fwabi-000386148b21

Best regards,
--  
Sven Peter <sven@kernel.org>


