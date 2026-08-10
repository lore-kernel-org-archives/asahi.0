Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72A53B71C9;
	Mon, 10 Aug 2026 22:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786401894; cv=none; b=HhHNSV/2fq8vHppCP+9Q+kXPhA7Wov7hXMU9dEcPOrklC6/tYIZpFvnoj3uBEPkcK1I/Y5LVuV4Cz1EAm4ac3y5NMV9mkxf9VmJ+Vzmjjjbs/LOdRnxs4hFlafKus9jpr2BlPVpsJgJQWBXQ12Sojp9sXPf4URB/i3n8XWf1Ycs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786401894; c=relaxed/simple;
	bh=dSQORQle+KIjxWhBpp5lvo41Zkwkl4W5lq+6fRaJHgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+MnPg2sb3ACPtET3pl9JDo3q2UJQx4G3mWAecmafv9LpXV0NpRddY1OzAo7tsozzuCLdINXyf4HexBT1OSUuYSsWspUAK5hoYB2NIuTdvk+A0UpjkYQX6IKzd7QlcJS5jSIDxR95lfDgP3Z0YlCcXWUVW/By8JQz29J8p6ftqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WnwgvrqR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WnwgvrqR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2AB11F000E9;
	Mon, 10 Aug 2026 22:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786401892;
	bh=KOkdJ9BIhW7CEAYkZmo2pUOQFCIBoHZYKysMZy5gsdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WnwgvrqRwNq2x/bxhu6M6wH2qcxd8xI8dq3yzelF0ZPCriLIYO9uyrxakrp3qr/h2
	 YsGij9lp0ZTPBWr6X4i7ckJtlqEfBRZoDJ2DnXgGBJEtjUnozgFX9/sdUri9Am7PyH
	 J1IwpTthoG9Oau9DDhUDcLbA1lU6l8MNTPR89odUHBiMAAtXB9zZzCYdo3AKc13ZiK
	 PGhPr+gyN07MK1xss7mtJDV71gYFIbd0/ew/Hd0Lt7v4SoEuK8BiuRYxFAaTlF5PKG
	 N/YGJKWgyeYPohjpOBs122rIHXVwCbVokX62M5Jh2P4sshIvLfHOrhmI2URYdlued2
	 JYobGVi2j8cSQ==
Date: Mon, 10 Aug 2026 16:44:50 -0600
From: Keith Busch <kbusch@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] Apple NVMe fixes for macOS 15+ firmware / M4 support
Message-ID: <anpUYquvgliLp2N-@kbusch-mbp>
References: <20260806-b4-nvme-fwabi-v1-0-bde19ce8db04@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-b4-nvme-fwabi-v1-0-bde19ce8db04@kernel.org>

On Thu, Aug 06, 2026 at 05:27:32PM +0200, Sven Peter wrote:
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

Thanks, applied to nvme-7.3.
