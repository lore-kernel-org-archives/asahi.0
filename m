Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4953C0A
	for <asahi@lists.linux.dev>; Wed, 19 Oct 2022 16:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF26C433C1;
	Wed, 19 Oct 2022 16:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666198467;
	bh=d4/4ZD6s1YFUuLMYMvCceYt3Rwz2SkopjdmOR9YOlt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oTCBjnY1yHKx7YZ4HVoRFrp8dQEWhpeuBS0LhH4MSRWvIqNTlMXaIBkx9vzQOjt5W
	 JbrePAs2l0hoCcyO/5usfM4i65HQwsLKfnc50MJiUKQ3gM9W9xHTG4lOM9XoMC+9Wd
	 BJv2UDTcI6qvg+8mEbJBW3/SEpbjtugB6JhUrAQCOvn7XAnXticnER9yIkWjd5RVvs
	 ufNY5D3brnw1vI6+TcLYlPI6TJMUefOEzPXbP6EvyNplNoftFNj1tJOGPvr1PbywYC
	 A05Gsz9397SKSIReEPYKDs4ZvMvn5Yx5pgaytJPU8JnUjF3owx/rgFVsd5XSGpxkLI
	 sj5/0dQ1LUYUA==
Date: Wed, 19 Oct 2022 22:24:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dmaengine: apple-admac: Fix grabbing of channels
 in of_xlate
Message-ID: <Y1Arv9uJnKgyqA41@matsya>
References: <20221019132324.8585-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221019132324.8585-1-povik+lin@cutebit.org>

On 19-10-22, 15:23, Martin Povišer wrote:
> The of_xlate callback is supposed to return the channel after already
> having 'grabbed' it for private use, so fill that in.

Applied both, thanks

-- 
~Vinod
