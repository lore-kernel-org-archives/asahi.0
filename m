Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB38C63AE
	for <asahi@lists.linux.dev>; Wed,  5 Apr 2023 15:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C5SXgci0NIPzcA+EStRsOpIQDFLWOuteDeIzGNio/z8=; b=wLhMMjFVp1rU0bbLT29EYFVlTt
	TY6bzbzB/rPGhL7wxagQiVdefhqipObsDLxj+9SX4BAll3VIYXnZgte9jwZ0jpKALbykuhK6BZblX
	J4ZGhihph7K2fXF8KJ9LgWM7DX/1dZtA+s9HG8kq42blZa5mRtW1ZPux+I4lkQOUWcSA/5/jVpXb9
	bf//HIXcMNht7pTU9zTvULwha7F3UHdYRBEq/eJubruvboV20NjyqiOr+ZHkqiZQIOMyyHvqmk9qd
	Co5Lgj3S7RdGdhK2Wbk4x8lApCuoKq7hHHvJ/EYV4fDdLl35HhuuCCPBlkTjnnE/4CPoXMaxluaBf
	qbVj1PDw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pk4yT-004qmY-2W;
	Wed, 05 Apr 2023 15:23:01 +0000
Date: Wed, 5 Apr 2023 08:23:01 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Chaitanya Kulkarni <kch@nvidia.com>
Cc: marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io,
	kbusch@kernel.org, hch@lst.de, sagi@grimberg.me,
	asahi@lists.linux.dev, linux-nvme@lists.infradead.org
Subject: Re: [PATCH 1/2] nvme-apple: return directly instead of else
Message-ID: <ZC2SVYgVybn3Hg4d@infradead.org>
References: <20230327054838.67353-1-kch@nvidia.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327054838.67353-1-kch@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Thanks,

applied to nvme-6.4.
