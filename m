Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8287F2E6CB8;
	Fri, 19 Jun 2026 09:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781861100; cv=none; b=jkEBgLu3SBQVuAci0SFXVqU1fyYwO/ZXveSMwALpstxk/yWzwfBOp4pYtsBJrhLhx2glWlhC211VDZCtIcbHeEhUS8Lf9/9t3m7xLd/RcABJKpVLVjyjzjTKH5OZGMk9UE/TVI7pbddc4o5N8HWKUvlb2Y386NosbClcGbdGRYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781861100; c=relaxed/simple;
	bh=oPE8IfH7Vl0rYGdWVgvVZxURIFdmgSAeaPx/vVZM5UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ptzbqb4XCVjTCmvtHzG7xo1TCHXp1dC/5OZBpfwI+DB/ARKGhYNSqEGHv0Mr+8l9JrPFWdOoM29+gJirx1vKLQZQnAEOGQ5/EDE2AiwjjmsyyD9Iw+BRt+uxQQTbKfiVCOrIZU9O9+LWsN249zdx/zJVmh2nTYnduzt+chbEtcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYhQOY3x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYhQOY3x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94A91F000E9;
	Fri, 19 Jun 2026 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781861099;
	bh=230KIaW9hT+AbOOUOlL6NjIRZroMk5K6aAspsvOlMcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hYhQOY3xrqUPTCie40QkEQxNyCq0+Tlw/vmMjZyF5izkcWe9haa5YLG+bDjbEysvb
	 9KzQ3A2+1WC/OCFeS+mkqBOJBGFJQ00rS/Ge3hdFieIo7knGTwQC2oYfXtMfnHL4k+
	 KihSHE+T3H4Sk/jo131yrorQz1Her2LNnFzBAihlH+VuRHXpbX28ZyoVi6wAt6GYVX
	 vitCzwJ1Kv38QJzMkeER24Y9mhhdbm2eI6JTTFnaLVMTRw8hn8oDemQ1qIOCvcsdzO
	 KSSDmueFeshkDvwVzELcYXQJ8JOPlMZPcnc8rQcU4PYiy6w5JxUVGWejKaoTVZTCoR
	 qZLQCz5ms4ZVw==
Date: Fri, 19 Jun 2026 10:24:54 +0100
From: Will Deacon <will@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH v2] arm64: errata: Handle Apple WFI State Loss
Message-ID: <ajUK5gIX_ZttSsx6@willie-the-truck>
References: <20260615-wfi-erratum-v2-1-59a73467f70d@cyberchaos.dev>
 <ajAT9fWgOd9HY7ei@willie-the-truck>
 <e105c7b2-a5eb-4b5d-955f-685058143e9d@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e105c7b2-a5eb-4b5d-955f-685058143e9d@cyberchaos.dev>

On Wed, Jun 17, 2026 at 09:23:03PM +0200, Yureka Lilian wrote:
> On 6/15/26 17:02, Will Deacon wrote:
> > In fact, would wfe be a better choice than nop for you?
> 
> Regarding wfe: Simply replacing the wfi with wfe on these particular
> machines leads to them getting stuck in the boot process (entering wfe on
> the boot core and never waking up again), maybe because some kinds of
> interrupts do not count as as events for the wfe wake-up?

argh, I had forgotten that a pending masked interrupt doesn't wake up
a WFE (it does wake up a WFI).

So we probably shouldn't have wfe in the list of idle instruction choices
(unless we want to rely on the eventstream).

Will
