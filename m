Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655A6347FEA;
	Mon, 13 Apr 2026 17:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776100870; cv=none; b=E1lZ6ZZVjErBz1cTlDvoBojtzYydbCrnN3dDUqRTPW8ifpzwxIWAz8Eilxw/Ui5bxPVFqfRsPEtlaknvRy8FIQ+dUnwmxJeO9hvNdmoRnraWjJgE8M/22SD3I94lAdCZuvsgiVf60g2Mlh7CPneagD3cWKJX/ao+oJvIkPlw/Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776100870; c=relaxed/simple;
	bh=M+OQXTluttDP+ZqTubaOzq9f/DqdsbvHrsNdryzA6I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0wNEqUPyust8io2N5r7c4R41kLiY9c1S7ihIGHBkSCV9z0RxQxhPB2WvTIGJtnwldLm9qprl9MbJ7uKyUigutbCHSoGc8jGFXbRcCHl/qCoAC++jBTJYMhkIdnf35jXZC8Igms2g4jfPhT0F3g7eJa0Ki46q64gEKENuWkXulk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aM1gFhZJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aM1gFhZJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00995C2BCB3;
	Mon, 13 Apr 2026 17:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776100870;
	bh=M+OQXTluttDP+ZqTubaOzq9f/DqdsbvHrsNdryzA6I8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aM1gFhZJwXYIN7bAlkGf3CvJJc3EkBlt2jZ1PVvzHNfkSFhDLSrjyyPhw9/iMUR0g
	 O0PNi1X4u0Y7FQQEvKkG7E/E+uESPvJezVfjnFXmQ5HJ443VtflG4qzGdoO00ghFEA
	 jMTTTNPAcbAMD73Z1MX3fa3ZzDds2s20vLTQoRz4EImQGuozeI3bvYuMB608L2ebhx
	 SMyOLg6MaVNjqwR+LyyszkXwLzx0cfXMNJLnJcqA07k4t/ZJ/RTEo6Jl8C6KKQ0JZj
	 4XFsUgdF7BvJ5QGJMW2NZyAzJem0YDqXRvTycnZkb8pwOUeVkEPvTjCERSMNnSLgiz
	 mEvpjiQeAgHQg==
Date: Mon, 13 Apr 2026 12:21:08 -0500
From: Rob Herring <robh@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Janne Grunau <j@jannau.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] Update Sasha Finkelstein's email address
Message-ID: <20260413172108.GA3079949-robh@kernel.org>
References: <20260411-mailmap-v1-0-5a519f7b00b5@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411-mailmap-v1-0-5a519f7b00b5@chaosmail.tech>

On Sat, Apr 11, 2026 at 04:36:06PM +0200, Sasha Finkelstein wrote:
> Moving away from gmail
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
> Sasha Finkelstein (2):
>       mailmap: Update Sasha Finkelstein's email address
>       dt-bindings: Update Sasha Finkelstein's email address

I think it is best if Janne takes the series.

Rob
