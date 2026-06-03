Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7C72C0F81;
	Wed,  3 Jun 2026 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780480450; cv=none; b=af2IWmUppt4Jga7xWjTgISsOp1C1CaDDmR5oMHNLjNsPeZ6lpYZUXbE6nckFC2BtlZ36n0MCp4sYgM//ZYjbTMGEX8vwmIUonBzvs08KownRhlEEfT7JJgHQ/noKyxSkxrkrBhyjkc1FHVw+3d++O58PMYDjssZ/djPnTYDE09c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780480450; c=relaxed/simple;
	bh=ysioR8E8fFaBQiGbTddQd4UjCeSOcxpyhAtA/CLvfdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbQpi+A+DJIXkG+RQSkMJK14B2SDCPc4r33VHwNhMZZS5k6WtlA0rpCGOheIfkNfx1b1RR+zRZHvfSw7LgcozsqwsSGLfxfdC5zUfoBZNiNKuxNuDbEnCbqovTasOGuP60FhDkL1M//hRkquVrVlJd3CZrFciWZ28Eht2grDL3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MM82qxf4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MM82qxf4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D101F00893;
	Wed,  3 Jun 2026 09:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780480449;
	bh=9xCV/qxJqiKKp2PBwOK0nokY77A79DqJoh7VyY2kPoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MM82qxf4iTqm031iiSIhaEh2ZzE5D12HodyvbRYuoARHXvhAV1vqkHt9X8WK+T0Sa
	 VbjfBRB5mb42kftUPgIcQwJ6C3Zkd+BvWG/g+e1gEPXsFQ4Z6KkAdSy56i3a9akUoI
	 TlYJiQKzI11nDSvlBJKgKL7OxUX0GtsHqFULQwWdsRZR83amm7MpW0dIxzKVg4uWBZ
	 5Ifdj0KvFaHJF5RAagFxdhva1S1zf9W/ASqk+N3NVTyfnp/z0eKyS4SI8xlPw38G3r
	 oJsx/BSrRJcgg8pEsFaLOGFt6Ds7x3Ao9cxixPAj+jXaePoZpg2BJAhEvQbmtQgYeS
	 ydOs585LONqtg==
Date: Wed, 3 Jun 2026 10:54:02 +0100
From: Keith Busch <kbusch@kernel.org>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: sven@kernel.org, linux-nvme@lists.infradead.org, axboe@kernel.dk,
	hch@lst.de, sagi@grimberg.me, j@jannau.net, neal@gompa.dev,
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, baijiaju1990@gmail.com
Subject: Re: [PATCH] nvme-apple: Use acquire/release for queue enabled state
Message-ID: <ah_5utfy2oJbUCw7@kbusch-mbp>
References: <20260603072205.3291888-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603072205.3291888-1-hanguidong02@gmail.com>

On Wed, Jun 03, 2026 at 03:22:05PM +0800, Gui-Dong Han wrote:
> apple_nvme_init_queue() initializes queue state and then marks the queue
> enabled. The interrupt and request paths check enabled before using that
> queue state.
> 
> The existing wmb() after WRITE_ONCE(enabled, true) orders the enabled
> store before later queue use, but it does not publish the earlier
> initialization before enabled becomes visible.
> 
> Use a release store when enabling the queue and acquire loads when
> testing it. Keep the existing wmb() in place for the
> store-before-later-use ordering.

Doesn't smp_store_release() already get you those semantics?

Also, there are a few other places doing the READ/WRITE_ONCE() calls in
apple_nvme_disable. Do you want to update those too for consistency?
