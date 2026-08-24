Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9593ED3CC;
	Mon, 24 Aug 2026 08:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561711; cv=none; b=BySpLJW10YqtIaM53Y8XV/lmHG3jJPWxJJl+bjmwJNjfaB57QAilYwVia7Bvs+ou2AXCKCbMcpBY8fwJ2nCaPoXZRQo37NMNQUkufacFOulcsQbJ+CObbOV3N1fH84SHnXvnsp8Xiq1Kh5tAUXK8fYDJARwA23Dc8ifxBbUKOSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561711; c=relaxed/simple;
	bh=Pp50ucJjEjKqxCgAu8cd+w0lxd9aPuVMjUJNaAV4uHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GK/ZK+QCXYed+gEkw/mzf6sgUCO6OLUXPvuKBLJk1IciUCWZxNc7satDlH+UryNF/YDu+3y7IJu0clsvrNNHwNlwo8bn6ot7leH6JLSBpXjXkIsouLph0JaHG6v/rNhAgnslxs/ABb1SLYSc1Y9QOvYLCaG8TWbRR+8NoX9Gx5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0YV0Zqw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0YV0Zqw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F3E1F000E9;
	Mon, 24 Aug 2026 08:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787561710;
	bh=HorS7PXF9rR3WDHtB1bZ/VAyiOvxI/CLjQGCPN+2hgo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=W0YV0Zqw2A7XPcDGGghz6aNHwX/9QkdhKJ4J9rNucg5vwBFN/utGfUTkMhjFkecbq
	 U3GS0wjxzG5SlypxjX9mDCG5kdSrD5ykBVmxf6E3ouUmM54sTc4LW93I5d1qG2PrPS
	 VlzTwagBlbDYgYQ8GYERZC3RK6tQGhTTdHe8QYHvdWNJ01rtcFFVIWe9xqhLbcA7IO
	 yvMUz80HrXcAIaqv7bFJjqwwBcRFZs40i4E05w3BMiRw5lpL4axJZs/XwQsG0Xb4PM
	 2dz6wDAgIxQcAxuCKtmD7GHnNYIjEp9fRAhzA45kb7jipzBh1WTm/S7yptXpNpo7PY
	 WcUjIuB7P/27g==
Message-ID: <b43ceb22-20c5-4930-a070-2f8199e304f2@kernel.org>
Date: Mon, 24 Aug 2026 10:55:07 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] soc: apple: rtkit: harden syslog shared-buffer
 handling
To: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>,
 Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>, Arnd Bergmann <arnd@arndb.de>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1787559303.git.acharyalaxman8848@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <cover.1787559303.git.acharyalaxman8848@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/24/26 10:26, Laxman Acharya Padhya wrote:
> Split the syslog hardening into focused changes as requested. The first
> patch fixes the SYSLOG_INIT reinitialization leak. The second prevents
> zero-sized messages and out-of-bounds shared-memory copies. The third
> corrects the entry-count boundary, and the fourth rate limits validation
> warnings controlled by the coprocessor.
>
> The index-boundary change has not been tested on Apple hardware running
> Linux. Asahi m1n1 describes the initialization field as COUNT, consistent
> with the kernel's syslog_n_entries name, but patch 3 is kept independent so
> it can be reverted without removing the shared-memory bounds protection.
>
> Testing:
>    - arm64 GCC build of drivers/soc/apple/rtkit.o with W=1 in Docker
>    - scripts/checkpatch.pl --strict on each patch

How was this found? If it was AI assisted please also add the 
appropriate Assisted-by: tags.
I'd also like a Tested-by from someone before I pick this up then to 
make sure you didn't break anything.



Sven
