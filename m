Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96A2472790
	for <asahi@lists.linux.dev>; Fri,  7 Aug 2026 15:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786116987; cv=none; b=Uz2lw3VGYUajSUi9TBXuG7JRGZtffNhZ7GEOAN+EENAut/CFG+LlH7Lan24tv1jWG0xbdWBiYHInbg64sEF8ISZBAdiEVJ9NyCONvsPz+RBUaGh0evoVF+1YUD9V4gceV7ymkDfr+Fcir3IThSxtMasCpvbWcf1K8Ud532pzNTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786116987; c=relaxed/simple;
	bh=IDpY1+KfrdeDpS9BOMeRp2ST5NX0el1Fq1Ngk5UX0mc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oF4Exx30n93xOm4rNA1ivR6ZNwqNAJe3UeUVdyK+okwv9wjHkK4cbzMUsj+5IrRYTC4/EnSdGV8CKqcVCV2L4TxJCFh3SJigXxNW3994qFZCZhuK6jcftqNRyILaWO/5LFEsvDDRPFzqW8vaXM9lUrMCiPK5jD49bD1ZYqGmnEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=mcV3olV9; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="mcV3olV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1786116978;
 bh=zzOSRUF+7X160qCUSiX8xJSfS6L9qF78Knb+9kxZ4EU=;
 b=mcV3olV9UKNCwoSyzDIXel7YkoWFvRFsmAIiOoW2njslQI+g5Fybkz24ngb5m+wSdwTEazFL4
 UMc5ldEwS57P2Ni0H3mN2BCb1T62xNLAzhinHhjG76a4+Jvbkh5bJjslvrs8k6q+kyeVtujhd9n
 x4wIdogWxDKXmxzaUDPfxBoEIxWkrm52Z6swK6UyKy+ewJTJTTB7EHV342M9+OeoFQcCm7F4A/z
 RPvdCg5Pb2jQmn3kDlNNE/2v8UNBtB6u34GyeLtdOcOHHhVKxPi4O1gDqxhPxM6BXOinGPuKbs/
 bEorEmZeg4NWWXLlwuL/XGM0B5tYyjG454G0gEo9xoPg==
X-Forward-Email-ID: 6a75fb6318a12650795556ff
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.13.10
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Fri, 07 Aug 2026 11:36:01 -0400
Message-Id: <DKITMCODIHJM.PFQGZCZKZJIH@ubuntu.com>
Cc: <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-nvme@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/6] Apple NVMe fixes for macOS 15+ firmware / M4
 support
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sven Peter" <sven@kernel.org>, "Janne Grunau" <j@jannau.net>, "Neal
 Gompa" <neal@gompa.dev>, "Keith Busch" <kbusch@kernel.org>, "Jens Axboe"
 <axboe@kernel.dk>, "Christoph Hellwig" <hch@lst.de>, "Sagi Grimberg"
 <sagi@grimberg.me>, "Arnd Bergmann" <arnd@arndb.de>
X-Mailer: aerc 0.21.0
References: <20260806-b4-nvme-fwabi-v1-0-bde19ce8db04@kernel.org>
In-Reply-To: <20260806-b4-nvme-fwabi-v1-0-bde19ce8db04@kernel.org>

On Thu Aug 6, 2026 at 11:27 AM EDT, Sven Peter wrote:
> Hi,
>
> This series fixes a bunch of bugs that were working fine with M1/M2 NVMe
> controllers with older firmware but are now starting to bite us.
> With macOS 15 a new firmware is installed for the controller and both
> XNU and the controller are a bit more strict now. This firmware is
> required once we add M4 support.
>
> The first patch fixes a panic that can happen when the controller fails
> to initialize, which now happens for the first time with the new
> firmware. The other fixes then make it work again.
>
> Best,
>
> Sven
>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
> Sven Peter (6):
>       nvme-apple: Destroy the admin queue on removal
>       nvme-apple: Don't set a DMA direction for commands without a data t=
ransfer
>       nvme-apple: Never set the opcode in the NVMMU TCB
>       nvme: Add a quirk for page aligned admin queue buffers
>       nvme-apple: Require page aligned buffers on the admin queue
>       nvme-apple: Drop the PRP null check chicken bit
>
>  drivers/nvme/host/apple.c | 32 +++++++++++++++-----------------
>  drivers/nvme/host/core.c  |  5 ++++-
>  drivers/nvme/host/nvme.h  |  7 +++++++
>  3 files changed, 26 insertions(+), 18 deletions(-)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260806-b4-nvme-fwabi-000386148b21
>
> Best regards,
> -- =20
> Sven Peter <sven@kernel.org>

On MacBookPro18,1 (J316s, 2021) with macOS 27 beta installed.

Tested-by: Joshua Peisach <jpeisach@ubuntu.com>
