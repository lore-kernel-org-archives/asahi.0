Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261E21850
	for <asahi@lists.linux.dev>; Sun, 13 Nov 2022 16:16:03 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6D7B768AA6; Sun, 13 Nov 2022 17:15:52 +0100 (CET)
Date: Sun, 13 Nov 2022 17:15:51 +0100
From: Christoph Hellwig <hch@lst.de>
To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
Cc: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Gerd Bayer <gbayer@linux.ibm.com>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>
Subject: Re: [PATCH 02/12] nvme: move OPAL setup from PCIe to core
Message-ID: <20221113161551.GA17733@lst.de>
References: <20221108150252.2123727-1-hch@lst.de> <20221108150252.2123727-3-hch@lst.de> <Y2wRHHdAGHqJA/7Q@kbusch-mbp.dhcp.thefacebook.com> <576b8902-0cba-3250-620b-fb5ef21ea6de@nvidia.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <576b8902-0cba-3250-620b-fb5ef21ea6de@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Nov 09, 2022 at 11:22:27PM +0000, Chaitanya Kulkarni wrote:
> why not move the sed-opal-code into its own file ?

It's literally just two functions.
