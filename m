Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FB1199FAB;
	Wed, 15 Apr 2026 14:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776264227; cv=none; b=JvWQDpuGConQuW8PtqFhdzWIO3fi5Ah8iLZmosxMKW7i3JczQhz7kDDOien5nYu+Loi3lZXqtOhuItCrXwb6rnmXa3vXsKyfAtII5eoQRCJJWdYSLUwR7MjQsQDn5LkgmbK6CV05x0fcmX7ibHzZz2Hv9bIWiul2zLLS+Ska/Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776264227; c=relaxed/simple;
	bh=9i7ucr/FPUAUV3jCqOGxaNo9oFryZ+19C0hp4xTZ5Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFRjc7F9YZOBexOiSvMimBJhRHtkBvngRGzpV4bgKmv6tq4hta47kTy54rvemG74qypvukIYv3y3DryvQZZ5BgsUIg4TB/HVVOmmDtF2r0e+VEFL1T8uxVGq6DsK4VF1FM2JbkoPRZX61aEwr3SUfIqASHjJbgPelHlmNViaqow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqaN5N0y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqaN5N0y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00294C19424;
	Wed, 15 Apr 2026 14:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776264226;
	bh=9i7ucr/FPUAUV3jCqOGxaNo9oFryZ+19C0hp4xTZ5Uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gqaN5N0y3dhQK5sTEFWhpO1r9tU761vPUZi8owXkbkxUuCf43H9sZDCxMQZy+f9KN
	 mI6BWzwbN5fafhk4e0A0FZmPVZfU/83bpV2JDMENoxCy6OtFpBhXFnPLmTDBhzCMQ2
	 60H817fc34qGrVXhEon5JM36u3tcIdep+7IYsRDzPBgvnw55PNyNTQ9+mSpXcgUMHk
	 eCI+X0VCixYvRAkUd1nvJ4HPGJJ0H1PRRyz+GiN5I3yEPZPALet5kVgptTRgS+NaGM
	 paz8nA3yapGK7dgXQQ1axdzJN7aagQ7fdKoKwfCQIqT6liWjnzO5xslrZwPwAveuPT
	 WvU1oD/9PLUcw==
Date: Wed, 15 Apr 2026 08:43:44 -0600
From: Keith Busch <kbusch@kernel.org>
To: =?utf-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
Cc: "hch@lst.de" <hch@lst.de>, Justin Tee <justintee8345@gmail.com>,
	"axboe@kernel.dk" <axboe@kernel.dk>,
	"sven@kernel.org" <sven@kernel.org>, "j@jannau.net" <j@jannau.net>,
	"neal@gompa.dev" <neal@gompa.dev>,
	"sagi@grimberg.me" <sagi@grimberg.me>,
	"justin.tee@broadcom.com" <justin.tee@broadcom.com>,
	"nareshgottumukkala83@gmail.com" <nareshgottumukkala83@gmail.com>,
	"paul.ely@broadcom.com" <paul.ely@broadcom.com>,
	James Smart <james.smart@broadcom.com>,
	"kch@nvidia.com" <kch@nvidia.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?7J207J2A7IiY?= <euns212.lee@samsung.com>,
	=?utf-8?B?7Lm47LCs?= <joshi.k@samsung.com>
Subject: Re: [PATCH v5] nvme: Skip trace complete_rq on host path error
Message-ID: <ad-kIPLsGO7iv8y0@kbusch-mbp>
References: <CGME20260415084107epcms2p71b9c0d252180653ab96a9f5f2121be71@epcms2p7>
 <20260415084107epcms2p71b9c0d252180653ab96a9f5f2121be71@epcms2p7>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260415084107epcms2p71b9c0d252180653ab96a9f5f2121be71@epcms2p7>

On Wed, Apr 15, 2026 at 05:41:07PM +0900, 전민식 wrote:
> Hi Keith, hch
> 
> Gentle ping for review on [PATCH v5] nvme: Skip trace complete_rq on 
> host path error.
> 
> I agree with your propsed approach. Should I send a new version(v6) 
> based on that?

Yes, I hadn't seen an updated patch yet so was just waiting for that.
Or was this one on me to submit?
