Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D9237C11F;
	Mon,  6 Jul 2026 18:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783364046; cv=none; b=qy0UvG0ve1/sIHHG1isr94Fu/MIuAZrR8f6fzK35v+a3W25mvfesu8NVddyj1K3aWJKaRf0dE1hhq1VftYK6M+NRXuoyKlKUihPxGljlh8baf5QxSf7vjBPdzIjXcSYjRbpv0dvAmKg5zZAuX64dqL6E1vzijByeVBSioP2/5ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783364046; c=relaxed/simple;
	bh=simS8gQW/+s9KDWquEkauP8KZnPtnvpy1faQMn5mPfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHCxQSjT39CgAHs+Hw8BKVrIEk3L9jckgYi4MQF62mbzZb7UxOnqqEpuYiZA/ecWaVt62TXRb21+Ct89trZwx22iUjnm6PPVLR2wLEk6ceNdDVC/gaJjOj/Iy6KnkHDQnHiBXqBp3tt+0sZit98S9jNs+Wh4xG9IhuMT3ayWcN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XtnFv4zf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XtnFv4zf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30A81F000E9;
	Mon,  6 Jul 2026 18:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783364045;
	bh=OdKd6q7VVmZu6vE+fSrmTrzPYB3Oq3rv09sQ4SZzZFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XtnFv4zfkYmOH5NoiBju7aItKcdcotaeM+w4X0SQQxIlnvTwnfs7Pp8xiGajI9WrF
	 SyHOyBQlclZFtZiIUsPSb/5oEAyI48EqWJLwS3NQaFRX0XlJL5/MhXVWYtDg4wsUuX
	 PUY2hF6WODRklwNwud9lg4pgObeKThWR9eNpifzb5WYiRS50+/ol5i1lTpqvU4w8BS
	 rHyc6AQiLCo9cZBcCdzM5QdCGVIxRJZ5ubOSuK7Y/CBgMC9xibHPZAD3RZ2JFJxZ5p
	 SDFZNRNJVD0FtRPU+q/onEjtettFj6WCmP8FEO/3S482xlmr9iQjrBgDRuADxXfoYw
	 8U8JczjBDKYpQ==
Date: Mon, 6 Jul 2026 12:54:03 -0600
From: Keith Busch <kbusch@kernel.org>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: sven@kernel.org, linux-nvme@lists.infradead.org, axboe@kernel.dk,
	hch@lst.de, sagi@grimberg.me, j@jannau.net, neal@gompa.dev,
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, baijiaju1990@gmail.com
Subject: Re: [PATCH v2] nvme-apple: Use acquire/release for queue enabled
 state
Message-ID: <akv5y0wqV76xKZmj@kbusch-mbp>
References: <20260618021543.3866850-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618021543.3866850-1-hanguidong02@gmail.com>

On Thu, Jun 18, 2026 at 10:15:43AM +0800, Gui-Dong Han wrote:
> apple_nvme_init_queue() initializes queue state and then marks the queue
> enabled. The interrupt and request paths check enabled before using that
> queue state.
> 
> The old wmb() after WRITE_ONCE(enabled, true) does not publish the
> earlier initialization before enabled becomes visible. Use a release store
> when enabling the queue and acquire loads when testing it.
> 
> Although the shutdown-side enabled accesses are not used for publishing
> queue initialization, use helpers for them as well for consistency.

Thanks, applied to nvme-7.3.
